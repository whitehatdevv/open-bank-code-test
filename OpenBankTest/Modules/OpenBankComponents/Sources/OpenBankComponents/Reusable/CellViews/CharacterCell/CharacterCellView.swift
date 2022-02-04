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
	let title = Atoms.Text.Heading.Secondary.bold
	let contentContainer = Atoms.Flexible.StackView.horizontal
	let bubbleComics = Molecules.Bubbles.Basic
	let bubbleSeries = Molecules.Bubbles.Basic
	let bubbleStories = Molecules.Bubbles.Basic
	let bubbleEvents = Molecules.Bubbles.Basic

	// MARK: - Computed properties
	lazy var contentContainerSubviews: [UIView] = {
		[bubbleComics, bubbleSeries, bubbleStories, bubbleEvents]
	}()
	lazy var secondContainerSubviews: [UIView] = {
		[title, contentContainer]
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
	public func bind(_ model: CharacterCellViewModel) {
		title.text = model.title
		imageView.image = UIImage(data: model.mainImage)
		bubbleSeries.bind(model.series)
		bubbleComics.bind(model.comics)
		bubbleStories.bind(model.stories)
		bubbleEvents.bind(model.events)
	}
	
}

// MARK: - Configure the view
extension CharacterCellView {

	func setupViews() {
		imageView.contentMode = .scaleToFill
		imageView.rounded()
		imageView.shadowed()

		secondContainerSubviews.forEach {
			$0.translatesAutoresizingMaskIntoConstraints = false
			subContainer.addArrangedSubview($0)
		}

		subContainer.spacing = Tokens.Margin.small
		contentContainer.spacing = Tokens.Margin.small
		contentContainer.alignment = .trailing
		contentContainer.distribution = .equalSpacing
		contentContainer.layoutMargins = Tokens.Edges.inputViews
		contentContainer.translatesAutoresizingMaskIntoConstraints = false
		contentContainerSubviews.forEach {
			$0.translatesAutoresizingMaskIntoConstraints = false
			$0.shadowed()
			contentContainer.addArrangedSubview($0)
		}

		mainContainer.spacing = Tokens.Margin.small
		mainContainer.translatesAutoresizingMaskIntoConstraints = false
		allSubviews.forEach {
			$0.translatesAutoresizingMaskIntoConstraints = false
			mainContainer.addArrangedSubview($0)
		}

		fill(mainContainer)

		NSLayoutConstraint.activate([
			title.topAnchor.constraint(equalTo: topAnchor, constant: Tokens.Margin.small),
			imageView.widthAnchor.constraint(equalToConstant: Tokens.Margin.xxxlarge*1.5),
			imageView.heightAnchor.constraint(equalToConstant: Tokens.Margin.xxxlarge*1.5)
		])
	}

}
