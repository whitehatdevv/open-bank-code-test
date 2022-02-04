//
//  CharacterCellView.swift
//  
//
//  Created by Manu Martinez on 3/2/22.
//

import UIKit

public class CharacterCellView: UIView {

	// MARK: - Properties
	let mainContainer = Atoms.Flexible.StackView.horizontal
	let subContainer = Atoms.Flexible.StackView.vertical
	let imageView = UIImageView(frame: .zero)
	let title = Atoms.Text.Heading.Primary.bold
	lazy var secondContainerSubviews: [UIView] = {
		[title]
	}()
	lazy var allSubviews: [UIView] = {
		[imageView, subContainer]
	}()

	// MARK: - Inits
	init() {
		super.init(frame: .zero)
		setupViews()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	// MARK: - Methods
	func bind(_ model: CharacterCellViewModel) {
		title.text = model.title
		imageView.image = UIImage(data: model.mainImage)
	}
	
}

// MARK: - Configure the view
extension CharacterCellView {

	func setupViews() {
		imageView.contentMode = .scaleToFill
		imageView.circular()
		imageView.shadowed()

		secondContainerSubviews.forEach {
			$0.translatesAutoresizingMaskIntoConstraints = false
			subContainer.addArrangedSubview($0)
		}

		mainContainer.translatesAutoresizingMaskIntoConstraints = false
		allSubviews.forEach {
			$0.translatesAutoresizingMaskIntoConstraints = false
			mainContainer.addArrangedSubview($0)
		}

		fill(mainContainer)
	}

}
