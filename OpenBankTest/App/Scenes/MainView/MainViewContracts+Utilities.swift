//
//  MainViewContracts+Utilities.swift
//  OpenBankTest
//
//  Created by Manu Martinez on 1/2/22.
//

import Foundation

// MARK: - Comunication between Model => View
protocol MainViewOutputProtocol: AnyObject {
	/// Update the current view configuration according to the state provided by the View Model
	/// - Parameters:
	///  - State: Indicates the current state that view needs to be configurated
	func update(_ state: MainViewState)
}

// MARK: - Comunication between View => Model
protocol MainViewInputProtocol {
	/// Called directly when the view enter on the willAppear methods
	func viewWillAppear()
	/// Paging the content to set the current needed offset
	/// - Parameters:
	///  - By: Indicates the paging we need actually
	/// - Important: It works directly with the table view
	func paging(multiply by: Int)
}

// MARK: - Routing navigation from Main View
protocol MainViewWireframe: AnyObject {
	/// Tells to the coordinator that we need to instance the detail view for a specific character
	/// - Parameters:
	///  - id: Indicates the id from the `Character` DOM object
	func goToDetail(_ id: String)
}

// MARK: - States used to configure the main view
enum MainViewState {
	/// Indicates that we need to get data async from `BEND`
	case loading
	/// An error has been detecting during some communication from ViewModel => View
	case error(Error)
	/// This case pass data directly to the view using a `DOM` object to be configured
	case data([Character])
}
