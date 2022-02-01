//
//  RootCoordinator.swift
//  OpenBankTest
//
//  Created by Manu Martinez on 1/2/22.
//

import Foundation
import Networking
import UIKit

class RootCoordinator {

	// MARK: - Dependencies
	private var client: APIClient
	private var navigationController: UINavigationController
	private var factory: RootFactory

	// MARK: - Inits
	init(_ factory: RootFactory, client: APIClient, navigationController: UINavigationController = UINavigationController()) {
		self.factory = factory
		self.client = client
		self.navigationController = navigationController
	}

	// MARK: - Methods
	func run() {
		
	}

}
