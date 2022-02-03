//
//  UIColor+Utilities.swift
//  
//
//  Created by Manu Martinez on 3/2/22.
//

import UIKit

extension UIColor {

	static func custom(secureName: String) -> UIColor {
		if #available(iOS 11.0, *) {
			guard let color = UIColor(named: secureName, in: Bundle.main, compatibleWith: nil) else {
				return .magenta
			}
			return color
		} else {
			return .magenta
		}
	}

}
