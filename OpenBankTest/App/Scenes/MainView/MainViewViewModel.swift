//
//  MainViewViewModel.swift
//  OpenBankTest
//
//  Created by Manu Martinez on 1/2/22.
//

import Foundation

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

	// MARK: - Inits
	init(_ view: MainViewOutputProtocol, wireframe: MainViewWireframe, provider: MainViewDataProvider) {
		self.view = view
		self.wireframe = wireframe
		self.provider = provider
	}

	// MARK: - Methods
	func getCharacters() {

	}

}

// MARK: - Implementing input from the View
extension MainViewViewModel: MainViewInputProtocol {

	func viewWillAppear() {
		getCharacters()
	}

}
