//
//  MainViewViewModel.swift
//  OpenBankTest
//
//  Created by Manu Martinez on 1/2/22.
//

import Foundation

class MainViewViewModel {

	// MARK: - Properties
	weak private var view: MainViewOutputProtocol?
	weak private var wireframe: MainViewWireframe?
	private var provider: MainViewDataProvider

	// MARK: - Inits
	init(_ view: MainViewOutputProtocol, wireframe: MainViewWireframe, provider: MainViewDataProvider) {
		self.view = view
		self.wireframe = wireframe
		self.provider = provider
	}

}

// MARK: - Implementing input from the View
extension MainViewViewModel: MainViewInputProtocol {

	func viewWillAppear() {
		
	}

}
