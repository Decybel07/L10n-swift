//
//  InterfaceController.swift
//  Example watchOS Extension
//
//  Created by Adrian Bobrowski on 10.05.2017.
//  Copyright © 2017 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

import WatchKit
import Foundation
import L10n

class InterfaceController: WKInterfaceController {

    @IBOutlet weak var languagePicker: WKInterfacePicker!
    @IBOutlet weak var helloWorldLabel: WKInterfaceLabel!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        self.l10n()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.l10n), name: .L10nLanguageChanged, object: nil)
    }

    func l10n() {
        self.helloWorldLabel.setText("HelloWorld".l10n())
        
        self.languagePicker.setItems([
            "language.english",
            "language.polish",
            "language.spanish",
            "language.japanese"
        ].map { key in
            let pickerItem = WKPickerItem()
            pickerItem.title = key.l10n()
            return pickerItem
        })
    }
    
    @IBAction func onLanguageChanged(_ value: Int) {
        L10n.shared.language = ["en", "pl", "es", "ja"][value]
    }
    
    
}
