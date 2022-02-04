//
//  RootViewController.swift
//  OpenBankComponentsSample
//
//  Created by Manu Martinez on 4/2/22.
//

import Foundation
import UIKit
import OpenBankComponents

class RootViewController: UIViewController {

	// MARK: - Properties
	private let tableView = UITableView(frame: .zero, style: .plain)
	private let vc: [(vc: UIViewController, name: String)] = [
		(vc: BubblesViewController(), name: "Bubbles")
	]

	// MARK: - Inits
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
extension RootViewController {

	func setupViews() {
		navigationItem.title = "Open Bank Sample Project"

		tableView.dataSource = self
		tableView.delegate = self
		view.fill(tableView)
	}

}

// MARK: - UITableViewDataSource's methods
extension RootViewController: UITableViewDataSource {

	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return vc.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
		cell.textLabel?.text = vc[indexPath.row].name
		return cell
	}

}

// MARK: - UITableViewDelegate's methods
extension RootViewController: UITableViewDelegate {

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let selected = vc[indexPath.row].vc
		navigationController?.pushViewController(selected, animated: true)
	}

}

