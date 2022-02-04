//
//  Tokens.swift
//  
//
//  Created by Manu Martinez on 3/2/22.
//

import Foundation
import UIKit

public enum Atoms {

	public enum Flexible {

		public static var view: UIView {
			let view = UIView()
			view.setContentHuggingPriority(.init(rawValue: 0), for: .horizontal)
			view.setContentHuggingPriority(.init(rawValue: 0), for: .vertical)
			return view
		}

		public enum StackView {

			public static var horizontal: UIStackView {
				let stack = UIStackView()
				stack.axis = .horizontal
				return stack
			}

			public static var vertical: UIStackView {
				let stack = UIStackView()
				stack.axis = .vertical
				return stack
			}

		}

	}

	public enum Text {

		public enum Heading {

			public enum Primary {
				public static var bold: UILabel {
					let label = UILabel()
					label.numberOfLines = 0
					label.backgroundColor = UIColor.clear
					label.textColor = Tokens.Colors.Font.primary
					return label
				}
			}

		}

	}

}
