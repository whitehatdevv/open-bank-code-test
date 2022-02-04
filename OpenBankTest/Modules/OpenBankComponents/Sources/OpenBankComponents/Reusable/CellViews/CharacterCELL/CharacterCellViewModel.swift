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
	let comics: Int
	let series: Int
	let stories: Int
	let events: Int

	public init(title: String, mainImage: Data, comics: Int, series: Int, stories: Int, events: Int) {
		self.title = title
		self.mainImage = mainImage
		self.comics = comics
		self.series = series
		self.stories = stories
		self.events = events
	}

}
