//
//  ViewController.swift
//  Example
//
//  Created by Adrian Bobrowski on 30.04.2017.
//  Copyright © 2017 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

import UIKit
import L10n

class ViewController: UIViewController {

    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var languageSegmentedControl: UISegmentedControl!

    @IBOutlet weak var helloWorldLabel: UILabel!

    @IBOutlet weak var appleStepper: UIStepper!
    @IBOutlet weak var numberOfApplesLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.l10n()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.l10n), name: .L10nLanguageChanged, object: nil)
    }

    func l10n() {
        self.helloWorldLabel.text = "HelloWorld".l10n()
        self.languageLabel.text = "language".l10n()

        [
            "language.english",
            "language.polish",
            "language.spanish",
            "language.japanese",
        ].enumerated().forEach { index, key in
            self.languageSegmentedControl.setTitle(key.l10n(), forSegmentAt: index)
        }

        self.numberOfApplesLabel.text = "numberOfApples".l10n(args: Int(self.appleStepper.value))
    }

    @IBAction func onLanguageChanged(_ sender: UISegmentedControl) {
        L10n.shared.language = ["en", "pl", "es", "ja"][sender.selectedSegmentIndex]
    }

    @IBAction func onNumberOfCountChnaged(_ sender: UIStepper) {
        self.numberOfApplesLabel.text = "numberOfApples".l10n(args: Int(sender.value))
    }
}
