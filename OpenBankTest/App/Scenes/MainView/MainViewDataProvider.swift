//
//  MainViewDataProvider.swift
//  OpenBankTest
//
//  Created by Manu Martinez on 1/2/22.
//

import Foundation
import Networking

struct CharacterThumbnailDTO: Codable {
	let path: String
	let `extension`: String
}

struct CharacterDTO: Codable {

	struct CharactersAvailableDTO: Codable {
		let available: Int
	}

	let id: String
	let name: String
	let thumbnail: CharacterThumbnailDTO
	let comics: CharactersAvailableDTO
	let series: CharactersAvailableDTO
	let stories: CharactersAvailableDTO
	let events: CharactersAvailableDTO
}

class CharactersRequest: Environment<[CharacterDTO]> {
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
	func getCharacters(paging: Paging, completion: @escaping(Result<[CharacterDTO], Error>) -> Void) {
		let request = CharactersRequest()
		client.send(request, completion: completion)
	}

}
