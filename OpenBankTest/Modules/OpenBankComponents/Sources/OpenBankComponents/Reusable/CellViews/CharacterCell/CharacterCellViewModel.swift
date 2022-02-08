//
//  CharacterCellViewModel.swift
//  
//
//  Created by Manu Martinez on 4/2/22.
//

import Foundation

/// Type definitions to make the core more readable
public typealias ConventionClosure = (Data?) -> Void

public class CharacterCellViewModel {

	let title: String
	let comics: BubbleModel
	let series: BubbleModel
	let stories: BubbleModel
	let events: BubbleModel
	var mainImage: Data?

	public init(mainImagePath: String, title: String, comics: BubbleModel, series: BubbleModel, stories: BubbleModel, events: BubbleModel, downloader: @escaping(_ path: String, _ completion: @escaping ConventionClosure) -> Void) {
		self.title = title
		self.comics = comics
		self.series = series
		self.stories = stories
		self.events = events
		downloader(mainImagePath, { data in
			self.mainImage = data
		})
	}

}
