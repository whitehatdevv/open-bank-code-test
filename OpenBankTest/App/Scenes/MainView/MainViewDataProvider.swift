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

struct CharacterDTO: Decodable {
	let id: Int
	let name: String
	let description: String
	let thumbnail: ThumbnailDTO
	let resourceURI: String
	let comics: ContentDTO
	let series: ContentDTO
	let stories: ContentDTO
	let events: ContentDTO
}

struct CharactersRequestResponse: Decodable {

	// MARK: - Properties
	let offset: Int
	let limit: Int
	let total: Int
	let characters: [CharacterDTO]

	// MARK: - Define coding keys
	enum CodingKeys: String, CodingKey {
		case data
		case offset
		case limit
		case total
		case characters = "results"
	}

	// MARK: - Using decode to get nested containers
	init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		let response = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .data)
		self.offset = try response.decode(Int.self, forKey: .offset)
		self.limit = try response.decode(Int.self, forKey: .limit)
		self.total = try response.decode(Int.self, forKey: .total)
		self.characters = try response.decode([CharacterDTO].self, forKey: .characters)
	}
	

}

// MARK: - Request definition
class CharactersRequest: Environment<CharactersRequestResponse> {
	// MARK: -- Inits
	init(_ paging: Paging? = nil) {
		var query = [URLQueryItem]()
		if let parameters = paging {
			query.append(URLQueryItem(name: "offset", value: "\(parameters.offset)"))
			query.append(URLQueryItem(name: "limit", value: "\(parameters.limit)"))
		}
		super.init(API.Characters.list.rawValue, queryItems: query)
	}

	func generateHeaders() -> [String : String] {
		return [
			"Content-type": "application/json"
		]
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
	func getCharacters(paging: Paging, completion: @escaping(Result<CharactersRequestResponse, Error>) -> Void) {
		let request = CharactersRequest(paging)
		client.send(request, completion: completion)
	}

}
