//
//  Character.swift
//  OpenBankTest
//
//  Created by Manu Martinez on 3/2/22.
//

import Foundation
import OpenBankComponents

struct Character {

	let id: Int
	let name: String
	let description: String
	let thumbnail: Thumbnail
	let resourceURI: String
	let comics: Content
	let series: Content
	let stories: Content
	let events: Content

	init(_ dto: CharacterDTO) {
		self.id = dto.id
		self.name = dto.name
		self.description = dto.description
		self.thumbnail = Thumbnail.init(dto.thumbnail)
		self.resourceURI = dto.resourceURI
		self.comics = Content.init(dto.comics)
		self.series = Content.init(dto.series)
		self.stories = Content.init(dto.stories)
		self.events = Content.init(dto.events)
	}

}

// MARK: - Extending character to set property
extension Character {

	var asCharacterCellViewModel: CharacterCellViewModel {
		CharacterCellViewModel(mainImagePath: self.thumbnail.path ,title: self.name, comics: BubbleModel(item: self.comics.available), series: BubbleModel(item: self.series.available), stories: BubbleModel(item: self.stories.available), events: BubbleModel(item: self.events.available), downloader: ImageDownloader.shared.downloadImage)
	}

}
