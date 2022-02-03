//
//  API.swift
//  OpenBankTest
//
//  Created by Manu Martinez on 1/2/22.
//

import Foundation

// MARK: - Constants with the needed credentials
struct Constants {
	struct APIKeys {
		static let `public` = "8783cd3adef6c1cd4b28ed778ad23227"
		static let `private` = "224bd5d36405aa119b3d01b8d523c7b3fe3c4387"
	}
}

// MARK: - Dynamic structure to create the needed resource paths
enum API: String {

	case basicURL = "https://gateway.marvel.com:443/v1/public"
	enum Characters: String {
		case list = ""
	}

}
