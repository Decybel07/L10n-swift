//
//  ChooseLanguageTableViewController.swift
//  Example
//
//  Created by Adrian Bobrowski on 15.08.2017.
//
//

import UIKit
import L10n_swift

final class ChooseLanguageTableViewController: UITableViewController {

    private var items: [L10n] = L10n.supportedLanguages.map { L10n(language: $0) }

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(
            self, selector: #selector(self.localizeUI), name: .L10nLanguageChanged, object: nil
        )
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.localizeUI()
    }

    // MARK: - @IBAction

    @IBAction private func localizeUI() {
        self.navigationItem.title = "chooseLanguage.title".l10n()
        self.tableView.reloadData()

        if let row = self.items.index(where: { $0.language == L10n.shared.language }) {
            self.tableView.selectRow(at: IndexPath(row: row, section: 0), animated: true, scrollPosition: .none)
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in _: UITableView) -> Int {
        return 1
    }

    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return self.items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "language", for: indexPath)
        let item = self.items[indexPath.row]

        cell.textLabel?.text = item.l10n()
        cell.detailTextLabel?.text = item.l10n(item)

        return cell
    }

    override func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        L10n.shared.language = self.items[indexPath.row].language
    }
}
