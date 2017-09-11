//
//  SimpleTranslatorViewController.swift
//  Example
//
//  Created by Adrian Bobrowski on 16.08.2017.
//
//

import UIKit
import L10n_swift

final class SimpleTranslatorViewController: UIViewController {

    // MARK: - @IBOutlet
    
    @IBOutlet
    fileprivate weak var pickerView: UIPickerView!
    
    @IBOutlet
    fileprivate weak var tableView: UITableView!

    // MARK: - variable
    
    fileprivate var languages: [String] = L10n.supportedLanguages
    fileprivate var items: [String] = [
        "apple", "bee", "cat", "dolphin", "elephant",
        "fish", "giraffe", "house", "iceCream", "jelly",
        "kite", "ladybird", "mouse", "newt", "octopus",
        "pig", "queen", "rocket", "snake", "teddybear",
        "umbrella", "vase", "whale", "xylophone", "yoYo",
        "zebra",
    ]

    fileprivate var from = L10n.shared
    fileprivate var to: L10n = {
        L10n(language: L10n.supportedLanguages.first(where: { $0 != L10n.shared.language }))
    }()

    // MARK: - Life cycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.pickerView.selectRow(self.languages.index(of: self.from.language) ?? 0, inComponent: 0, animated: false)
        self.pickerView.selectRow(self.languages.index(of: self.to.language) ?? 0, inComponent: 1, animated: false)
    }
}

// MARK: - UITableViewDataSource

extension SimpleTranslatorViewController: UITableViewDataSource {

    func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        return self.items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "translator", for: indexPath)
        let key = "simpleTranslator.list.\(self.items[indexPath.row])"

        cell.textLabel?.text = key.l10n(self.from)
        cell.detailTextLabel?.text = key.l10n(self.to)

        return cell
    }
}

// MARK: - UIPickerViewDataSource

extension SimpleTranslatorViewController: UIPickerViewDataSource {

    func numberOfComponents(in _: UIPickerView) -> Int {
        return 2
    }

    func pickerView(_: UIPickerView, numberOfRowsInComponent _: Int) -> Int {
        return self.languages.count
    }
}

// MARK: - UIPickerViewDelegate

extension SimpleTranslatorViewController: UIPickerViewDelegate {

    func pickerView(_: UIPickerView, titleForRow row: Int, forComponent _: Int) -> String? {
        return L10n.shared.locale?.localizedString(forLanguageCode: self.languages[row])
    }

    func pickerView(_: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            self.from = L10n(language: self.languages[row])
        } else if component == 1 {
            self.to = L10n(language: self.languages[row])
        }
        self.tableView.reloadData()
    }
}
