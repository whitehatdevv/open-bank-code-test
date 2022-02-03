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

	public enum TextField {

		public static var rightTextField: UITextField {
			let textField = UITextField()
			textField.borderStyle = .none
			textField.font = Tokens.Typography.body1
			textField.textAlignment = .right
			textField.tintColor = Tokens.Colors.Font.secondary
			textField.textColor = Tokens.Colors.Font.primary
			return textField
		}

		public static var leftTextField: UITextField {
			let textField = UITextField()
			textField.borderStyle = .none
			textField.font = Tokens.Typography.body1
			textField.textAlignment = .left
			textField.tintColor = Tokens.Colors.Font.secondary
			textField.textColor = Tokens.Colors.Font.primary
			return textField
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

			public enum Tertiary {
				public static var bold: UILabel {
					let label = UILabel()
					label.numberOfLines = 0
					label.backgroundColor = UIColor.clear
					label.textColor = Tokens.Colors.Font.tertiary
					return label
				}
			}

		}

		public enum Caption1 {

			public enum Primary {
				public static var medium: UILabel {
					let label = UILabel()
					label.numberOfLines = 0
					label.backgroundColor = UIColor.clear
					label.textColor = Tokens.Colors.Font.primary
					label.font = Tokens.Typography.caption1
					return label
				}
			}

			public enum Secondary {
				public static var regular: UILabel {
					let label = UILabel()
					label.numberOfLines = 0
					label.backgroundColor = UIColor.clear
					label.textColor = Tokens.Colors.Font.secondary
					label.font = Tokens.Typography.caption1
					return label
				}

				public static var medium: UILabel {
					let label = UILabel()
					label.numberOfLines = 0
					label.backgroundColor = UIColor.clear
					label.textColor = Tokens.Colors.Font.secondary
					label.font = Tokens.Typography.caption1
					return label
				}
			}

			public enum Error {
				public static var medium: UILabel {
					let label = UILabel()
					label.numberOfLines = 0
					label.backgroundColor = UIColor.clear
					label.textColor = Tokens.Colors.Font.error
					label.font = Tokens.Typography.caption1
					return label
				}
			}

		}

	}

}
