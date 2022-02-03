//
//  RootContainer.swift
//  OpenBankTest
//
//  Created by Manu Martinez on 1/2/22.
//

import Foundation
import UIKit

class RootContainer: UIViewController {

	//MARK: - Properties
	var oldChild: UIViewController?
	var current: UIViewController?
	var timestamp = TimeInterval(0)

	//MARK: - Inits
	init() {
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	//MARK: - Methods

	/// Activate the container inserting the main point of the application
	/// - Parameters:
	///  - scene: `UIViewController` of whatever subclass of it.
	func activate(_ scene: UIViewController) {

		if current != nil {
			timestamp = 0.3
		}else{
			timestamp = 0
		}

		self.oldChild = current
		scene.willMove(toParent: self)
		addChild(scene)
		view.addSubview(scene.view)
		scene.didMove(toParent: self)
		self.current = scene

		self.current?.view.alpha = 0
		UIView.animate(withDuration: timestamp) {
			self.current?.view.alpha = 1
			Debugger.printLog(.debug, message: "Scene will be presented: \(String(describing: self.current?.description))")
		} completion: { _ in
			self.oldChild?.willMove(toParent: nil)
			self.oldChild?.removeFromParent()
			self.oldChild?.view.removeFromSuperview()
			self.oldChild?.didMove(toParent: nil)
		}

	}

}
