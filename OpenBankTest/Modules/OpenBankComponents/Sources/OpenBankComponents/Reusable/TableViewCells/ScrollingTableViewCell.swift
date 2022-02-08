//
//  ScrollingTableViewCell.swift
//  
//
//  Created by Manu Martinez on 8/2/22.
//

import Foundation
import UIKit

public class ScrollingTableViewCell: UITableViewCell {

	// MARK: - Properties
	public static let identifier = "ScrollingTableViewCell.identifier"
	let view = Molecules.CellViews.SpinnerCellView

	// MARK: - Inits
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		setupViews()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

}

// MARK: - Implementing View Configuration
extension ScrollingTableViewCell {

	func setupViews() {
		shadowed()
		fill(view)
	}

}
