//
//  MainViewDataProvider.swift
//  OpenBankTest
//
//  Created by Manu Martinez on 1/2/22.
//

import Foundation
import Networking

struct CharactersDTO: Codable {

}

class CharactersRequest: Environment<[CharactersDTO]> {
	// MARK: -- Inits
	init(parameters: [URLQueryItem] = []) {
		super.init(API.Characters.list.rawValue)
	}
}

class MainViewDataProvider {

	// MARK: - Dependencies
	private var client: APIClient

	// MARK: - Inits
	init(_ client: APIClient) {
		self.client = client
	}

	// MARK: - Methods
	func getCharacters(completion: @escaping(Result<[CharactersDTO], Error>) -> Void) {
		let request = CharactersRequest()
		client.send(request, completion: completion)
	}

}
