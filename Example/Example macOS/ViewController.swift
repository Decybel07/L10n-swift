//
//  ViewController.swift
//  Example
//
//  Created by Adrian Bobrowski on 10.05.2017.
//  Copyright © 2017 Coding lifestyle. All rights reserved.
//

import Cocoa
import L10n

class ViewController: NSViewController {

    @IBOutlet weak var languageLabel: NSTextField!
    @IBOutlet weak var languageSegmentedControl: NSSegmentedControl!
    @IBOutlet weak var helloWorldLabel: NSTextField!
    @IBOutlet weak var numberOfApplesLabel: NSTextField!
    @IBOutlet weak var numberOfApplesTextField: NSTextField!
    
    var numberOfApples: Int = 0 {
        didSet {
            self.numberOfApplesLabel.stringValue = "numberOfApples".l10n(self.numberOfApples)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.l10n()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.l10n), name: .L10nLanguageChanged, object: nil)
    }
    
    func l10n() {
        self.helloWorldLabel.stringValue = "HelloWorld".l10n()
        self.languageLabel.stringValue = "language".l10n()
        
        [
            "language.english",
            "language.polish",
            "language.spanish",
            "language.japanese",
        ].enumerated().forEach { index, key in
            self.languageSegmentedControl.setLabel(key.l10n(), forSegment: index)
        }
        
        self.numberOfApplesLabel.stringValue = "numberOfApples".l10n(self.numberOfApples)
    }
    
    @IBAction func onLanguageChanged(_ sender: NSSegmentedControl) {
        L10n.shared.language = ["en", "pl", "es", "ja"][sender.selectedSegment]
    }
}
