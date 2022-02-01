//
//  MainViewController.swift
//  OpenBankTest
//
//  Created by Manu Martinez on 1/2/22.
//

import Foundation
import UIKit

class MainViewController: UIViewController {

	// MARK: - Dependencies
	var model: MainViewInputProtocol?

	// MARK: - Inits
	init() {
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	// MARK: - View lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
		setupViews()
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		model?.viewWillAppear()
	}

	// MARK: - Methods

}

// MARK: - Configure the view
extension MainViewController {

	func setupViews() {
		view.backgroundColor = .red
	}

}

// MARK: - Implementing output from the view
extension MainViewController: MainViewOutputProtocol {


}
