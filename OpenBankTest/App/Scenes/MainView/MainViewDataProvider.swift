//
//  MainViewDataProvider.swift
//  OpenBankTest
//
//  Created by Manu Martinez on 1/2/22.
//

import Foundation
import Networking

// MARK: - Used DTOs
struct ItemsDTO: Codable {
	let resourceURI: String
	let name: String
	let type: String?
}

struct ContentDTO: Codable {
	let available: Int
	let collectionURI: String
	let items: [ItemsDTO]
	let returned: Int
}

struct ThumbnailDTO: Codable {
	let path: String
	let `extension`: String
}

struct CharacterDTO: Codable {
	let id: String
	let name: String
	let description: String
	let thumbnail: ThumbnailDTO
	let resourceURI: String
	let comics: ContentDTO
	let series: ContentDTO
	let stories: ContentDTO
	let events: ContentDTO
}

// MARK: - Request definition
class CharactersRequest: Environment<[CharacterDTO]> {
	// MARK: -- Inits
	init(_ paging: Paging? = nil) {
		var query = [URLQueryItem]()
		if let parameters = paging {
			query.append(URLQueryItem(name: "offset", value: "\(parameters.offset)"))
			query.append(URLQueryItem(name: "limit", value: "\(parameters.limit)"))
		}
		super.init(API.Characters.list.rawValue, queryItems: query)
	}
}


// MARK: - Provider definition
class MainViewDataProvider {

	// MARK: - Dependencies
	private var client: APIClient

	// MARK: - Inits
	init(_ client: APIClient) {
		self.client = client
	}

	// MARK: - Methods
	func getCharacters(paging: Paging, completion: @escaping(Result<[CharacterDTO], Error>) -> Void) {
		let request = CharactersRequest(paging)
		client.send(request, completion: completion)
	}

}
