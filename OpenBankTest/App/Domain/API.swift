//
//  API.swift
//  OpenBankTest
//
//  Created by Manu Martinez on 1/2/22.
//

import Foundation

struct Constants {
	struct APIKeys {
		static let `public` = "8783cd3adef6c1cd4b28ed778ad23227"
		static let `private` = ""
	}
}

enum API: String {

	case basicURL = "https://gateway.marvel.com:443/v1/public"
	enum Characters: String {
		case list = ""
	}

}
