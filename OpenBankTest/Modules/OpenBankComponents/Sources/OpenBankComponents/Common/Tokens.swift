//
//  Tokens.swift
//  
//
//  Created by Manu Martinez on 3/2/22.
//

import Foundation
import UIKit

public enum Tokens {

	public enum View {
		public enum StackView {
			public static var horizontal: UIStackView {
				let stackView = UIStackView()
				stackView.axis = .horizontal
				stackView.distribution = .fill
				return stackView
			}

			public static var vertical: UIStackView {
				let stackView = UIStackView()
				stackView.axis = .vertical
				stackView.alignment = .center
				stackView.distribution = .fillEqually
				return stackView
			}
		}
	}

	public enum Text {
		public var heading: UILabel {
			let label = UILabel()
			label.font = UIFont(name: "HelveticaNeue-CondensedBlack", size: 25)
			return label
		}

		public var title: UILabel {
			let label = UILabel()
			label.font = UIFont(name: "HelveticaNeue-CondensedBlack", size: 20)
			return label
		}

		public var body: UILabel {
			let label = UILabel()
			label.font = UIFont(name: "HelveticaNeue-CondensedBlack", size: 14)
			return label
		}
	}

	public enum Colors {
		public enum Background {
			public static var primary = UIColor.systemYellow
			public static var secondary = UIColor.secondarySystemFill
		}

		public enum Text {
			public static var primary = UIColor.white
			public static var secondary = UIColor.black
		}
	}

}
