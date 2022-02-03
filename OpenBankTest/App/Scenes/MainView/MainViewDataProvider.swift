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

	// MARK: - Properties
	let id: String
	let name: String
	let description: String
	let thumbnail: ThumbnailDTO
	let resourceURI: String
	let comics: ContentDTO
	let series: ContentDTO
	let stories: ContentDTO
	let events: ContentDTO

	// MARK: - Used coding keys
	enum CodingKeys: String, CodingKey {
		case data
		case result
		case id
		case name
		case description
		case thumbnail
		case resourceURI
		case comics
		case series
		case stories
		case events
	}

	// MARK: Used decode init to used nested containers
	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		let results = try values.nestedContainer(keyedBy: CodingKeys.self, forKey: .data).nestedContainer(keyedBy: CodingKeys.self, forKey: .result)
		self.id = try results.decode(String.self, forKey: .id)
		self.name = try results.decode(String.self, forKey: .name)
		self.description = try results.decode(String.self, forKey: .description)
		self.thumbnail = try results.decode(ThumbnailDTO.self, forKey: .thumbnail)
		self.resourceURI = try results.decode(String.self, forKey: .resourceURI)
		self.comics = try results.decode(ContentDTO.self, forKey: .comics)
		self.series = try results.decode(ContentDTO.self, forKey: .series)
		self.stories = try results.decode(ContentDTO.self, forKey: .stories)
		self.events = try results.decode(ContentDTO.self, forKey: .events)
	}

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
	func getCharacters(paging: Paging, completion: @escaping(Result<[CharacterDTO], Error>) -> Void) {
		let request = CharactersRequest(paging)
		client.send(request, completion: completion)
	}

}
