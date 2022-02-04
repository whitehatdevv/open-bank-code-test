//
//  API.swift
//  OpenBankTest
//
//  Created by Manu Martinez on 1/2/22.
//

import Foundation

// MARK: - Dynamic structure to create the needed resource paths
enum API: String {

	case basicURL = "https://gateway.marvel.com:443/v1/public/"
	enum Characters: String {
		case list = "characters"
	}

}
