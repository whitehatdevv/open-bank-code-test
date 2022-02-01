//
//  RootFactory.swift
//  OpenBankTest
//
//  Created by Manu Martinez on 1/2/22.
//

import Foundation
import Networking

struct RootFactory {

	func createMainScene(_ client: APIClient, wireframe: MainViewWireframe) -> MainViewController {
		let scene = MainViewController()
		let provider = MainViewDataProvider(client)
		let model = MainViewViewModel(scene, wireframe: wireframe, provider: provider)
		scene.model = model
		return scene
	}

}
