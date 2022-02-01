//
//  HTTPMethods.swift
//  
//
//  Created by Manu Martinez on 1/2/22.
//

import Foundation

public enum HTTPMethods: String {

	case POST = "POST"
	case GET = "GET"
	case PUT = "PUT"
	case PATCH = "PATCH"
	case DELETE = "DELETE"

	var isSave: Bool {
		switch self {
			case .GET:
			return false
			case .POST, .PUT, .PATCH, .DELETE:
			return true
		}
	}

}
