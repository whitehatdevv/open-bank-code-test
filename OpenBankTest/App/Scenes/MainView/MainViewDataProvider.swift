//
//  MainViewDataProvider.swift
//  OpenBankTest
//
//  Created by Manu Martinez on 1/2/22.
//

import Foundation
import Networking

//class CharactersRequest: JSONAPIRequest {
//
//	// MARK: - Properties
//	var decoder: JSONDecoder = JSONDecoder()
//	typealias APIResponse = <#T##Type###>
//	var resourcePath: String
//
//
//}

class MainViewDataProvider {

	// MARK: - Dependencies
	private var client: APIClient

	// MARK: - Inits
	init(_ client: APIClient) {
		self.client = client
	}

	// MARK: - Methods
	func getCharacters(completion: @escaping(Result<[String], Error>) -> Void) {

	}

}
