//
//  Comic.swift
//  OpenBankTest
//
//  Created by Manu Martinez on 3/2/22.
//

import Foundation

struct Content {

	let available: Int
	let collectionURI: String
	let items: [Item]

	init(_ dto: ContentDTO) {
		self.available = dto.available
		self.collectionURI = dto.collectionURI
		self.items = dto.items.map(Item.init)
	}

}
