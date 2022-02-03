//
//  RootFactory.swift
//  OpenBankTest
//
//  Created by Manu Martinez on 1/2/22.
//

import Foundation
import Networking

// MARK: - Abstract factory used for instance all the scenes
struct RootFactory {

	/// Create the main scene using `Dependency Injection` to set all the properties
	/// - Parameters:
	///  - client: APIClient used for the Network Requests
	///  - wireframe: Responsible of navigation flow
	/// - Returns: `MainViewController` with all the needed property configured
	func createMainScene(_ client: APIClient, wireframe: MainViewWireframe) -> MainViewController {
		let scene = MainViewController()
		let provider = MainViewDataProvider(client)
		let model = MainViewViewModel(scene, wireframe: wireframe, provider: provider)
		scene.model = model
		return scene
	}

}
