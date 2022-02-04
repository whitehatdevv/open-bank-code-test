//
//  BubblesViewController.swift
//  OpenBankComponentsSample
//
//  Created by Manu Martinez on 4/2/22.
//

import Foundation
import UIKit
import OpenBankComponents

class BubblesViewController: UIViewController {

	// MARK: - Properties
	private let bubble = Molecules.Bubbles.Basic

	// MARK: - Inits
	init() {
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	// MARK: - View Lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
		setupViews()
	}

}

// MARK: - Configure the view
extension BubblesViewController {

	func setupViews() {
		navigationItem.title = "Bubble view"
		view.backgroundColor = .white

		bubble.translatesAutoresizingMaskIntoConstraints = false
		bubble.bind(BubbleModel(item: 10))
		view.addSubview(bubble)

		NSLayoutConstraint.activate([
			bubble.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			bubble.centerYAnchor.constraint(equalTo: view.centerYAnchor),
			bubble.widthAnchor.constraint(equalToConstant: Tokens.Margin.xxlarge)
		])
	}

}
