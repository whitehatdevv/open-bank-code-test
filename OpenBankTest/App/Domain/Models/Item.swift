//
//  Item.swift
//  OpenBankTest
//
//  Created by Manu Martinez on 3/2/22.
//

import Foundation

struct Item {

	let resourceURI: String
	let name: String

	init(_ dto: ItemsDTO) {
		self.resourceURI = dto.resourceURI
		self.name = dto.name
	}

}
