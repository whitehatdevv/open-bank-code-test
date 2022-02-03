//
//  MainViewContracts+Utilities.swift
//  OpenBankTest
//
//  Created by Manu Martinez on 1/2/22.
//

import Foundation

protocol MainViewOutputProtocol: AnyObject {
	func update(_ state: MainViewState)
}

protocol MainViewInputProtocol {
	func viewWillAppear()
	func paging(multiply by: Int)
}

protocol MainViewWireframe: AnyObject {
	
}

enum MainViewState {
	case loading
	case error(Error)
	case data([Character])
}
