//
//  MainViewDataProvider.swift
//  OpenBankTest
//
//  Created by Manu Martinez on 1/2/22.
//

import Foundation
import Networking

class MainViewDataProvider {

	// MARK: - Dependencies
	private var client: APIClient

	// MARK: - Inits
	init(_ client: APIClient) {
		self.client = client
	}

}
