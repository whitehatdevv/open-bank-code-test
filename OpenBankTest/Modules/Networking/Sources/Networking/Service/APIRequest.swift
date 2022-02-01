//
//  APIRequest.swift
//  
//
//  Created by Manu Martinez on 1/2/22.
//

import Foundation

public protocol APIRequest {

	//MARK: - Properties
	associatedtype APIResponse
	var encoder: JSONEncoder { get }
	var resourcePath: String { get }
	var method: HTTPMethods { get }

	//MARK: - Methods
	func generateBody() -> Data?
	func generateHeaders() -> [String: String]
	func generateQueryItems() -> [URLQueryItem]
	func generateURLrequest(_ baseURL: URL) -> URLRequest

	//MARK: - Used methods
	func accept(_ response: HTTPURLResponse) -> Bool
	func parse(_ response: HTTPURLResponse, data: Data?) -> Result<APIResponse, Error>
	func error(_ response: HTTPURLResponse, data: Data?, error: Error?) -> Result<APIResponse, Error>

}
