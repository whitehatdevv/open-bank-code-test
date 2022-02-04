//
//  CharacterTableViewController.swift
//  OpenBankComponentsSample
//
//  Created by Manu Martinez on 4/2/22.
//

import Foundation
import UIKit
import OpenBankComponents

class CharacterTableViewController: UIViewController {

	// MARK: - Properties
	private let tableView = UITableView(frame: .zero, style: .insetGrouped)
	private var dataset = [CharacterCellViewModel]() {
		didSet {
			tableView.reloadData()
		}
	}

	// MARK: - Init
	init() {
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	// MARK: - View Lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
		setupViews()
	}

}

// MARK: - Configure the view
extension CharacterTableViewController {

	func setupViews() {

		navigationItem.title = "Character cell"
		view.backgroundColor = Tokens.Colors.Background.primary

		tableView.backgroundColor = .clear
		tableView.dataSource = self
		tableView.estimatedRowHeight = Tokens.Margin.xlarge
		tableView.register(CharactersTableViewCell.self, forCellReuseIdentifier: CharactersTableViewCell.identifier)

		view.fill(tableView)
		setupDataset()
	}

	func setupDataset() {
		guard let imageData = UIImage(named: "spiderman")?.pngData() else {
			fatalError("Have you laoded this image?")
		}
		dataset = [
			CharacterCellViewModel(title: "Example", mainImage: imageData, comics: BubbleModel(item: 10), series: BubbleModel(item: 20), stories: BubbleModel(item: 30), events: BubbleModel(item: 40))
		]
	}

}

// MARK: - UITableView DataSource's methods
extension CharacterTableViewController: UITableViewDataSource {

	func numberOfSections(in tableView: UITableView) -> Int {
		dataset.count
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 1
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: CharactersTableViewCell.identifier) as? CharactersTableViewCell else {
			fatalError("Cell cannot be identified. Have you registered it?")
		}
		cell.bind(dataset[indexPath.section])
		return cell
	}

}
