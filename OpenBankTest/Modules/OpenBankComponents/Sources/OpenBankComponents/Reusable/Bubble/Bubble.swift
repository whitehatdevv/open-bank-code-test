//
//  Bubble.swift
//  
//
//  Created by Manu Martinez on 4/2/22.
//

import Foundation
import UIKit

public class Bubble: UIView {

	// MARK: - Properties
	let container = Atoms.Flexible.StackView.vertical
	let item = Atoms.Text.Heading.Secondary.bold
	// MARK: - Inits
	init() {
		super.init(frame: .zero)
		setupViews()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	// MARK: - Methods
	public func bind(_ model: BubbleModel) {
		item.text = "\(model.item)"
	}

}

// MARK: - Configure the view
extension Bubble {

	func setupViews() {
		backgroundColor = Tokens.Colors.Background.primary

		container.translatesAutoresizingMaskIntoConstraints = false
		item.translatesAutoresizingMaskIntoConstraints = false
		container.addArrangedSubview(item)

		rounded()
		bordered()
		fill(container, edges: Tokens.Edges.inputViews)

		NSLayoutConstraint.activate([
			item.centerXAnchor.constraint(equalTo: centerXAnchor),
			item.centerYAnchor.constraint(equalTo: centerYAnchor)
		])
	}

}
