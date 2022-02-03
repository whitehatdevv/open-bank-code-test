//
//  MainViewController.swift
//  OpenBankTest
//
//  Created by Manu Martinez on 1/2/22.
//

import Foundation
import UIKit

class MainViewController: UIViewController {

	// MARK: - Dependencies
	var model: MainViewInputProtocol?

	// MARK: - Properties
	private let tableView = UITableView(frame: .zero, style: .insetGrouped)
	private var data = [Character]() {
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

	// MARK: - Methods

}

// MARK: - Configure the view
extension MainViewController {

	func setupViews() {

		view.backgroundColor = .systemYellow
		navigationItem.title = "Characters"

		tableView.backgroundColor = .clear
		tableView.delegate = self
		tableView.dataSource = self

		view.addSubview(tableView)
		NSLayoutConstraint.activate([
			tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
			tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
			tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
		])

	}

}

// MARK: - UITableView Data Source
extension MainViewController: UITableViewDataSource {

	func numberOfSections(in tableView: UITableView) -> Int {
		data.count
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 1
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		return UITableViewCell()
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
