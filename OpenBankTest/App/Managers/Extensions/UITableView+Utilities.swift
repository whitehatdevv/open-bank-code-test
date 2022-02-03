//
//  UITableView+Utilities.swift
//  OpenBankTest
//
//  Created by Manu Martinez on 3/2/22.
//

import UIKit

/// Indicate the behaviour that the BG of the table should have
enum TableViewBackgroundState {
	case loading
	case error(String)
	case normal
}

extension UITableView {

	/// Configure table view `backgroundView` according to the state provided.
	/// - Parameters:
	///  - state: `TableViewBackgroundState` tell us the table view state
	func setBackgound(to state: TableViewBackgroundState) {
		switch state {
		case .loading:
			let spinnerTable = UIActivityIndicatorView(style: .large)
			spinnerTable.tintColor = UIColor.black
			spinnerTable.hidesWhenStopped = true
			spinnerTable.startAnimating()
			self.backgroundView = spinnerTable
		case .error(let message):
			let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
			messageLabel.text = message
			messageLabel.textColor = .black
			messageLabel.numberOfLines = 0
			messageLabel.textAlignment = .center
			messageLabel.font = UIFont(name: "TrebuchetMS", size: 15)
			messageLabel.sizeToFit()
			self.backgroundView = messageLabel
			self.backgroundView?.backgroundColor = backgroundColor
		case .normal:
			backgroundView = nil
		}
	}

}
