//
//  CharactersTableViewCell.swift
//  
//
//  Created by Manu Martinez on 3/2/22.
//

import UIKit

public class CharactersTableViewCell: UITableViewCell {

	// MARK: - Properties
	public static let identifier = "CharactersTableViewCell.identifier"
	let view = Molecules.CellViews.CharacterCell

	// MARK: - Inits
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		setupViews()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	// MARK: - Methods
	public func bind(_ model: CharacterCellViewModel) {
		view.bind(model)
	}
	
}

// MARK: - Implementing View Configuration
extension CharactersTableViewCell {

	func setupViews() {
		fill(view)
	}

}
