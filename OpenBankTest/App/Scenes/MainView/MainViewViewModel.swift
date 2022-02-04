//
//  MainViewViewModel.swift
//  OpenBankTest
//
//  Created by Manu Martinez on 1/2/22.
//

import Foundation
import OpenBankComponents

struct Paging {
	let limit: Int = 20
	var offset: Int
}

class MainViewViewModel {

	// MARK: - Dependencies
	weak private var view: MainViewOutputProtocol?
	weak private var wireframe: MainViewWireframe?
	private var provider: MainViewDataProvider

	// MARK: - Properties
	private var dom = [Character]()
	private var state: MainViewState = .loading {
		didSet {
			Debugger.printLog(.debug, message: "State updated: \(state)")
			view?.update(state)
		}
	}

	private var paging: Paging = .init(offset: 0) {
		didSet {
			getCharacters()
		}
	}

	// MARK: - Inits
	init(_ view: MainViewOutputProtocol, wireframe: MainViewWireframe, provider: MainViewDataProvider) {
		self.view = view
		self.wireframe = wireframe
		self.provider = provider
	}

	// MARK: - Methods
	func transformData(_ dto: [CharacterDTO]) {
		dom = dto.map { Character.init($0) }
		let viewObject = dom.map { $0.asCharacterCellViewModel }
		self.state = .data(viewObject)
	}

	func getCharacters() {
		provider.getCharacters(paging: paging) { result in
			switch result {
			case .success(let dto):
				Debugger.printLog(.debug, message: " CHARACTERS REQUEST => Offset: \(dto.offset) && Limit: \(dto.limit) && Total: \(dto.total)")
				self.transformData(dto.characters)
			case .failure(let error):
				self.state = .error(error)
			}
		}
	}

}

// MARK: - Implementing input from the View
extension MainViewViewModel: MainViewInputProtocol {

	func viewWillAppear() {
		view?.update(state)
		getCharacters()
	}

	func paging(multiply by: Int) {
		paging.offset = by
	}

	func tapOnCell(_ index: Int) {
		wireframe?.goToDetail(dom[index].id)
	}

}
