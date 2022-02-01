//
//  Debugger.swift
//  OpenBankTest
//
//  Created by Manu Martinez on 1/2/22.
//

import Foundation

class Debugger {

	//MARK: - Methods
	static func printLog(_ environment: DebuggerEnvironments, message: String) {
		print("\n \(environment.rawValue) \(message)")
	}

}
