//
//  PluralsViewController.swift
//  Example
//
//  Created by Adrian Bobrowski on 17.08.2017.
//
//

import UIKit
import L10n_swift

final class PluralsViewController: UIViewController {

    // MARK: - @IBOutlet

    @IBOutlet
    weak var tableView: UITableView!

    @IBOutlet
    weak var stepper: UIStepper!

    @IBOutlet
    weak var numberField: UITextField!

    // MARK: - variable

    fileprivate var items: [L10n] = L10n.supportedLanguages.map { L10n(language: $0) }
    fileprivate var value: Int = 0

    // MARK: - @IBAction

    @IBAction
    private func onTapped() {
        self.view.endEditing(true)
    }

    @IBAction
    private func onFieldValueChanged(_ sender: UITextField) {
        let value = Int(sender.text ?? "") ?? 0
        self.stepper.value = Double(value)
        self.onValueChanged(value)
    }

    @IBAction
    private func onStepperValueChanged(_ sender: UIStepper) {
        let value = Int(sender.value)
        self.numberField.text = value.description
        self.onValueChanged(value)
    }

    private func onValueChanged(_ value: Int) {
        self.value = value
        self.tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource

extension PluralsViewController: UITableViewDataSource {

    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return self.items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "plural", for: indexPath)
        let item = self.items[indexPath.row]

        cell.textLabel?.text = L10n.shared.locale?.localizedString(forLanguageCode: item.language)
        cell.detailTextLabel?.text = "plurals.numberOfApples".l10n(item, arg: self.value)

        return cell
    }
}
