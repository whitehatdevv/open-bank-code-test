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
	private var window: UIWindow
	private var client: APIClient
	private var navigationController: UINavigationController
	private var factory: RootFactory
	private var container: RootContainer

	// MARK: - Inits
	init(_ window: UIWindow, factory: RootFactory, container: RootContainer, client: APIClient, navigationController: UINavigationController = UINavigationController()) {
		self.window = window
		self.factory = factory
		self.container = container
		self.client = client
		self.navigationController = navigationController
	}

	// MARK: - Methods
	func run() {
		let scene = factory.createMainScene(client, wireframe: self)
		window.rootViewController = scene
		window.makeKeyAndVisible()
		navigationController.viewControllers = [scene]
		container.activate(navigationController)
	}

}

// MARK: - Implementing routing from Main View
extension RootCoordinator: MainViewWireframe {


}
