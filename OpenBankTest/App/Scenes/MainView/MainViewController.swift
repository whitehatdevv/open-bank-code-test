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
	var model: MainViewViewModel?

	// MARK: - Inits
	init() {
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}


	// MARK: - Methods

}

// MARK: - Implementing output from the view
extension MainViewController: MainViewOutputProtocol {


}
