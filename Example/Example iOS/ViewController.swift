//
//  ViewController.swift
//  Example
//
//  Created by Adrian Bobrowski on 30.04.2017.
//  Copyright © 2017 Coding lifestyle. All rights reserved.
//

import UIKit
import L10n

class ViewController: UIViewController {

    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var languageSegmentedContrlo: UISegmentedControl!

    @IBOutlet weak var helloWorldLabel: UILabel!

    @IBOutlet weak var appleStepper: UIStepper!
    @IBOutlet weak var numberOfApplesLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        l10n()
    }

    func l10n() {
        helloWorldLabel.text = "HelloWorld".l10n()
        languageLabel.text = "language".l10n()

        languageSegmentedContrlo.setTitle("language.english".l10n(), forSegmentAt: 0)
        languageSegmentedContrlo.setTitle("language.polish".l10n(), forSegmentAt: 1)
        languageSegmentedContrlo.setTitle("language.spanish".l10n(), forSegmentAt: 2)
        languageSegmentedContrlo.setTitle("language.japanese".l10n(), forSegmentAt: 3)

        numberOfApplesLabel.text = "numberOfApples".l10n(Int(appleStepper.value))
    }

    @IBAction func onLanguageChanged(_ sender: UISegmentedControl) {
        L10n.shared.language = ["en", "pl", "es", "ja"][sender.selectedSegmentIndex]
        l10n()
    }

    @IBAction func onNumberOfCountChnaged(_ sender: UIStepper) {
        numberOfApplesLabel.text = "numberOfApples".l10n(Int(sender.value))
    }
}
