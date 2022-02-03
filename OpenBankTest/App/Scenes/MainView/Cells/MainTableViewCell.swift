//
//  MainTableViewCell.swift
//  OpenBankTest
//
//  Created by Manu Martinez on 3/2/22.
//

import UIKit

class MainTableViewCell: UITableViewCell {

	// MARK: - Properties
	static var cellId = "MainTableViewCell.identifier"

	// MARK: - Objects
	let stackView = UIStackView(frame: .zero)
	let nameTitle = UILabel(frame: .zero)
	let imageProfile = UIImageView(frame: .zero)
	lazy var allSubviews: [UIView] = {
		[nameTitle, imageProfile]
	}()

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

// MARK: - Configure thre cell view
extension MainTableViewCell {


}
