//
//  MainViewViewModel.swift
//  OpenBankTest
//
//  Created by Manu Martinez on 1/2/22.
//

import Foundation

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
	private var state: MainViewState = .loading {
		didSet {
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
		#warning("Pending to implement")
	}

	func getCharacters() {
		provider.getCharacters(paging: paging) { result in
			switch result {
			case .success(let dto):
				self.transformData(dto)
			case .failure(let error):
				self.state = .error(error)
			}
		}
	}

}

// MARK: - Implementing input from the View
extension MainViewViewModel: MainViewInputProtocol {

	func viewWillAppear() {
		getCharacters()
	}

	func paging(multiply by: Int) {
		paging.offset = by
	}

}
