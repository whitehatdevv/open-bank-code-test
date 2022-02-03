//
//  String+Utilities.swift
//  OpenBankTest
//
//  Created by Manu Martinez on 3/2/22.
//

import Foundation
import CryptoKit

extension String {
	/// MD5 property to convert a fully string to MD5 used for API Utilities
	var MD5: String {
		let computed = Insecure.MD5.hash(data: self.data(using: .utf8)!)
		return computed.map { String(format: "%02hhx", $0) }.joined()
	}
}
