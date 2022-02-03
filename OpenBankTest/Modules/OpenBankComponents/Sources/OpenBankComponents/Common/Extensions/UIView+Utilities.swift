//
//  UIView+Utilities.swift
//  
//
//  Created by Manu Martinez on 3/2/22.
//

import Foundation
import UIKit

public extension UIView {

	func fill(_ content: UIView = Atoms.Flexible.view, edges: UIEdgeInsets = .zero) {
			content.translatesAutoresizingMaskIntoConstraints = false
			addSubview(content)

			NSLayoutConstraint.activate([
				content.topAnchor.constraint(equalTo: topAnchor, constant: edges.top),
				content.leadingAnchor.constraint(equalTo: leadingAnchor, constant: edges.left),
				content.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -edges.bottom),
				content.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -edges.right)
			])
		}

}
