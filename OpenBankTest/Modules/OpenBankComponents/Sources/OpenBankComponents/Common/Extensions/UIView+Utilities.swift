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
	
	func rounded(_ cornerRadius: CGFloat = Tokens.Radius.corner) {
		layer.cornerRadius = cornerRadius
		layer.masksToBounds = true
	}

	func circular() {
		layer.cornerRadius = frame.height / 2
		layer.masksToBounds = true
	}

	func bordered(borderColor: UIColor = .clear, borderWidth: CGFloat = 1) {
		layer.borderColor = borderColor.cgColor
		layer.borderWidth = borderWidth
	}

	func shadowed(
		opacity: Float = Tokens.Opacity.shadow,
		offset: CGSize = Tokens.Offset.shadow,
		color: UIColor = Tokens.Colors.Shadow.primary) {
			layer.shadowColor = color.cgColor
			layer.shadowOffset = offset
			layer.shadowRadius = Tokens.Radius.shadow
			layer.shadowOpacity = opacity
		}
	
}
