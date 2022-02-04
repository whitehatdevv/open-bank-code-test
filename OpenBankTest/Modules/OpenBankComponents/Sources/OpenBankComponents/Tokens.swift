//
//  Tokens.swift
//  
//
//  Created by Manu Martinez on 3/2/22.
//

import UIKit

public enum Tokens {

	public enum Typography {

		public static let title1 = UIFont.systemFont(ofSize: 28)
		public static let title2 = UIFont.systemFont(ofSize: 20)
		public static let headline1 = UIFont.systemFont(ofSize: 17)
		public static let body1 = UIFont.systemFont(ofSize: 15)
		public static let button1 = UIFont.systemFont(ofSize: 17)
		public static let caption1 = UIFont.systemFont(ofSize: 12)
		public static let numbers = UIFont.monospacedDigitSystemFont(ofSize: 17, weight: .regular)

	}

	public enum Colors {

		public enum Shadow {
			public static let primary = UIColor.black
			public static let secondary = UIColor.white
		}

		public enum Background {
			public static let primary = UIColor.yellow
		}

		public enum Border {
			public static let normal = UIColor.black
			public static let error = UIColor.red
		}

		public enum Font {
			public static let primary = UIColor.white
		}

	}

	public enum Radius {
		public static var corner: CGFloat = 8
		public static var shadow: CGFloat = 5
	}

	public enum Offset {
		public static var shadow: CGSize = .init(width: 0, height: 2)
	}

	public enum Opacity {
		public static var shadow: Float = 1
	}

	public enum Margin {
		public static let xsmall: CGFloat = 4
		public static let small: CGFloat = 8
		public static let mediumSmall: CGFloat = 16
		public static let mediumLarge: CGFloat = 18
		public static let large: CGFloat = 24
		public static let xlarge: CGFloat = 32
		public static let xxlarge: CGFloat = 40
		public static let xxxlarge: CGFloat = 50
	}

	public enum Edges {
		public static var inputViews: UIEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
	}

}
