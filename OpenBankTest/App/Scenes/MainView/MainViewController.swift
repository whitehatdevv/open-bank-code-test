//
//  MainViewController.swift
//  OpenBankTest
//
//  Created by Manu Martinez on 1/2/22.
//

import Foundation
import UIKit
import OpenBankComponents

class MainViewController: UIViewController {

	// MARK: - Dependencies
	var model: MainViewInputProtocol?

	// MARK: - Properties
	private let tableView = UITableView(frame: .zero, style: .insetGrouped)
	private var data = [CharacterCellViewModel]() {
		didSet {
			tableView.reloadData()
		}
	}

	// MARK: - Inits
	init() {
		super.init(nibName: nil, bundle: nil)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	// MARK: - View lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
		setupViews()
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		model?.viewWillAppear()
	}

}

// MARK: - Configure the view
extension MainViewController {

	func setupViews() {
		view.backgroundColor = Tokens.Colors.Background.secondary
		navigationItem.title = "Characters"

		tableView.register(CharactersTableViewCell.self, forCellReuseIdentifier: CharactersTableViewCell.identifier)
		tableView.backgroundColor = .clear
		tableView.delegate = self
		tableView.dataSource = self

		view.fill(tableView)
	}

}

// MARK: - UITableView Data Source
extension MainViewController: UITableViewDataSource {

	func numberOfSections(in tableView: UITableView) -> Int {
		data.count
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		1
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: CharactersTableViewCell.identifier) as? CharactersTableViewCell else {
			fatalError("Identifier not found, have you registered it?")
		}
		cell.bind(data[indexPath.section])
		return cell
	}

}

// MARK: - Implementing UITableView Delegate
extension MainViewController: UITableViewDelegate {

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		Debugger.printLog(.debug, message: "Tapped on cell \(indexPath.section)")
		model?.tapOnCell(indexPath.section)
	}

}

// MARK: - Implementing output from the view
extension MainViewController: MainViewOutputProtocol {

	func update(_ state: MainViewState) {
		switch state {
		case .loading:
			self.tableView.setBackgound(to: .loading)
		case .error(let error):
			self.tableView.setBackgound(to: .error(error.localizedDescription))
		case .data(let dom):
			self.tableView.setBackgound(to: .normal)
			self.data = dom
		}
	}

}
