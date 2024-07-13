//
//  DateExtensionTests.swift
//  L10n_swift
//
//  Created by Adrian Bobrowski on 17.05.2018.
//  Copyright © 2018 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

import XCTest
@testable import L10n_swift

final class DateExtensionTests: L10nBaseTest {

    lazy var date: Date = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter.date(from: "1993-12-07 08:25:36")!
    }()

    func testDate() {
        self.l10nInstance.language = "pl_PL"
        XCTAssertTrue(["07.12.1993, 08:25:36", "07.12.1993 o 08:25:36"].contains(self.date.l10n(self.l10nInstance)))
    }

    func testDateWithDateStyle() {
        self.l10nInstance.language = "pl_PL"

        XCTAssertEqual("", self.date.l10n(self.l10nInstance, dateStyle: .none))
        XCTAssertEqual("7.12.1993", self.date.l10n(self.l10nInstance, dateStyle: .short))
        XCTAssertEqual("07.12.1993", self.date.l10n(self.l10nInstance, dateStyle: .medium))
        XCTAssertEqual("7 grudnia 1993", self.date.l10n(self.l10nInstance, dateStyle: .long))
        XCTAssertEqual("wtorek, 7 grudnia 1993", self.date.l10n(self.l10nInstance, dateStyle: .full))
    }

    func testDateWithTimeStyle() {
        self.l10nInstance.language = "pl_PL"

        XCTAssertEqual("", self.date.l10n(self.l10nInstance, timeStyle: .none))
        XCTAssertEqual("08:25", self.date.l10n(self.l10nInstance, timeStyle: .short))
        XCTAssertEqual("08:25:36", self.date.l10n(self.l10nInstance, timeStyle: .medium))
    }

    func testDateWithDateStyleAndTimeStyle() {
        self.l10nInstance.language = "pl_PL"

        XCTAssertEqual("", self.date.l10n(self.l10nInstance, dateStyle: .none, timeStyle: .none))
        XCTAssertEqual("7.12.1993, 08:25", self.date.l10n(self.l10nInstance, dateStyle: .short, timeStyle: .short))
    }

    func testDateWithFormat() {
        self.l10nInstance.language = "pl_PL"

        XCTAssertEqual("1993 12 07", self.date.l10n(self.l10nInstance, format: "yyyy MM dd"))
        XCTAssertEqual("08 25 36", self.date.l10n(self.l10nInstance, format: "HH mm ss"))
        XCTAssertEqual("1993 12 07 - 08 25 36", self.date.l10n(self.l10nInstance, format: "yyyy MM dd - HH mm ss"))
    }
    
    func testDateWithTemplate() {
        self.l10nInstance.language = "pl_PL"

        XCTAssertEqual("07.12.1993", self.date.l10n(self.l10nInstance, template: "yyyy MM dd"))
        XCTAssertEqual("08:25:36", self.date.l10n(self.l10nInstance, template: "HH mm ss"))
    }

    func testDateWithConfigureFormatter() {
        self.l10nInstance.language = "pl_PL"

        XCTAssertEqual("Dzisiaj", Date().l10n(self.l10nInstance) {
            $0.doesRelativeDateFormatting = true
            $0.dateStyle = .long
        })
    }
}
