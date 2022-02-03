//
//  Environment.swift
//  OpenBankTest
//
//  Created by Manu Martinez on 3/2/22.
//

import Foundation
import Networking

class Environment<T: Codable>: JSONAPIRequest {

	// MARK: - Properties
	public var decoder: JSONDecoder
	public var resourcePath: String
	var queryItems: [URLQueryItem]
	public typealias APIResponse = T

	// MARK: - Inits
	init(_ resourcePath: String, queryItems: [URLQueryItem] = [], decoder: JSONDecoder = JSONDecoder()) {
		self.resourcePath = resourcePath
		self.decoder = decoder
		self.queryItems = queryItems
	}

	// MARK: - Methods
	private func getTimestamp() -> Date {
		Date.now
	}

	private func getHash(_ ts: Date) -> String {
		"\(ts)\(Constants.APIKeys.private)\(Constants.APIKeys.public)".MD5
	}

	public func generateQueryItems() -> [URLQueryItem] {
		let ts = getTimestamp()
		return [
			URLQueryItem(name: "ts", value: "\(String(describing: ts))"),
			URLQueryItem(name: "apiKey", value: ""),
			URLQueryItem(name: "hash", value: getHash(ts))
		] + queryItems
	}

}
