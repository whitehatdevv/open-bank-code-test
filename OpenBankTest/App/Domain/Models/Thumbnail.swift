//
//  Thumbnail.swift
//  OpenBankTest
//
//  Created by Manu Martinez on 3/2/22.
//

import Foundation

struct Thumbnail {

	let path: String
	let ext: String

	init(_ dto: ThumbnailDTO) {
		self.path = dto.path
		self.ext = dto.`extension`
	}

}
