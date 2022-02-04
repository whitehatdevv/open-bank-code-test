//
//  CharacterCellViewModel.swift
//  
//
//  Created by Manu Martinez on 4/2/22.
//

import Foundation


public struct CharacterCellViewModel {

	let title: String
	let mainImage: Data
	let comics: BubbleModel
	let series: BubbleModel
	let stories: BubbleModel
	let events: BubbleModel

	public init(title: String, mainImage: Data, comics: BubbleModel, series: BubbleModel, stories: BubbleModel, events: BubbleModel) {
		self.title = title
		self.mainImage = mainImage
		self.comics = comics
		self.series = series
		self.stories = stories
		self.events = events
	}

}
