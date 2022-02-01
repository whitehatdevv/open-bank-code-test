//
//  APIErrors.swift
//  
//
//  Created by Manu Martinez on 1/2/22.
//

import Foundation

/// Indicates when yiu reveived an error calling a API Service
public enum APIErrors: String, Error {
	case invalidURLRequest = "Server request cannot be generated"
	case invalidDecodeResponse = "Server response cannot be decoded"
	case undefinedNetworkError = "Undefined network error"
	case invalidHTTPRequest = "Invalid HTTP Request"
}
