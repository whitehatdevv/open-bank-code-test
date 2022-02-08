//
//  ScrollingCellView.swift
//  
//
//  Created by Manu Martinez on 8/2/22.
//

import Foundation
import UIKit

public class ScrollingCellView: UIView {

	// MARK: - Properties
	private let container = Atoms.Flexible.StackView.vertical
	private let activityIndicator = UIActivityIndicatorView(frame: .zero)

	// MARK: - Inits
	init() {
		super.init(frame: .zero)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	// MARK: - Methods
	public func startAnimating() {
		activityIndicator.startAnimating()
	}

	public func stopAnimating() {
		activityIndicator.stopAnimating()
	}

}

// MARK: - Configure the view
extension ScrollingCellView {

	func setupViews() {

		backgroundColor = Tokens.Colors.Background.secondary
		activityIndicator.color = Tokens.Colors.Font.primary
		activityIndicator.hidesWhenStopped = true

		container.translatesAutoresizingMaskIntoConstraints = false
		activityIndicator.translatesAutoresizingMaskIntoConstraints = false
		container.addArrangedSubview(container)

		fill(container)

		NSLayoutConstraint.activate([
			activityIndicator.centerXAnchor.constraint(equalTo: container.centerXAnchor),
			activityIndicator.centerYAnchor.constraint(equalTo: container.centerYAnchor)
		])

	}

}
