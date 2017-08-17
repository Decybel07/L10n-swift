//
//  MainViewController.swift
//  iOS
//
//  Created by Adrian Bobrowski on 30.07.2017.
//
//

import UIKit

final class MainViewController: UITableViewController {

    @IBOutlet weak var infoLabel: UILabel!

    private var items: [String] = [
        "changeLanguage",
        "simpleTranslator",
        "plurals",
    ]

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        self.localizeUI()

        NotificationCenter.default.addObserver(
            self, selector: #selector(self.localizeUI), name: .L10nLanguageChanged, object: nil
        )
    }

    // MARK: - @IBAction

    @IBAction private func localizeUI() {
        self.navigationItem.backBarButtonItem?.title = "navigation.back".l10n()
        self.infoLabel.text = "info".l10n()
        self.tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in _: UITableView) -> Int {
        return 1
    }

    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return self.items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = self.items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: self.items[indexPath.row], for: indexPath)
        cell.textLabel?.text = "main.\(identifier)".l10n()
        return cell
    }
}
