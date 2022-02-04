//
//  RootViewController.swift
//  OpenBankComponentsSample
//
//  Created by Manu Martinez on 4/2/22.
//

import Foundation
import UIKit

class RootViewController: UIViewController {

	// MARK: - Properties
	let vc: [(vc: UIViewController, name: String)] = []

	// MARK: - Inits
	init() {
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

}
