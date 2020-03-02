//
//  Number+Localizable.swift
//  L10n_swift
//
//  Created by Adrian Bobrowski on 16/06/2019.
//  Copyright © 2019 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

import Foundation

// MARK: - NSNumberRepresentable

public protocol NSNumberRepresentable {
    func asNSNumber() -> NSNumber
}

// MARK: - NumericLocalizable

public protocol NumericLocalizable: Localizable {

    /**
     Returns a localized `self` description.

     - parameter instance: The instance of `L10n` used for localization.
     - parameter closure: A closure used to configure the `NumberFormatter`.

     - returns: A localized `self` description.
     */
    func l10n(_ instance: L10n, closure: (_ formatter: NumberFormatter) -> Void) -> String
}

extension NumericLocalizable {

    /**
     Returns a localized `self` description.

     - parameter instance: The instance of `L10n` used for localization.
     */
    public func l10n(_ instance: L10n) -> String {
        return self.l10n(instance) { _ in }
    }

    /**
     Returns a localized `self` description.

     - parameter closure: A closure used to configure the `NumberFormatter`.

     - returns: A localized `self` description.
     */
    func l10n(closure: (_ formatter: NumberFormatter) -> Void) -> String {
        return self.l10n(.shared, closure: closure)
    }
}

extension NumericLocalizable where Self: NSNumberRepresentable {

    public func l10n(_ instance: L10n = .shared, closure: (_ formatter: NumberFormatter) -> Void) -> String {
        return self.asNSNumber().l10n(instance, closure: closure)
    }
}

// MARK: - IntegerLocalizable

public protocol IntegerLocalizable: NumericLocalizable {}

extension IntegerLocalizable {

    /**
     Returns a localized `self` description with leading zeros.

     - parameter instance: The instance of L10n used for localization.
     - parameter minIntegerDigits: The minimal number of integer digits.

     - returns: A localized `self` description with leading zeros.
     */
    public func l10n(_ instance: L10n = .shared, minIntegerDigits: Int) -> String {
        return self.l10n(instance) { formatter in
            formatter.minimumIntegerDigits = minIntegerDigits
        }
    }
}

// MARK: - FloatingPointLocalizable

public protocol FloatingPointLocalizable: NumericLocalizable {}

extension FloatingPointLocalizable {
    /**
     Returns a localized `self` description with defined number of `fractionDigits`.

     - parameter instance: The instance of `L10n` used for localization.
     - parameter fractionDigits: The number of fraction digits.

     - returns: A localized `self` description with defined number of `fractionDigits`.
     */
    public func l10n(_ instance: L10n = .shared, fractionDigits: Int) -> String {
        return self.l10n(instance) { formatter in
            formatter.minimumIntegerDigits = 1
            formatter.minimumFractionDigits = fractionDigits
            formatter.maximumFractionDigits = fractionDigits
        }
    }
}

// MARK: - Numbers

extension Int8: NSNumberRepresentable, IntegerLocalizable {

    public func asNSNumber() -> NSNumber {
        return self as NSNumber
    }
}

extension UInt8: NSNumberRepresentable, IntegerLocalizable {

    public func asNSNumber() -> NSNumber {
        return self as NSNumber
    }
}

extension Int16: NSNumberRepresentable, IntegerLocalizable {

    public func asNSNumber() -> NSNumber {
        return self as NSNumber
    }
}

extension UInt16: NSNumberRepresentable, IntegerLocalizable {

    public func asNSNumber() -> NSNumber {
        return self as NSNumber
    }
}

extension Int32: NSNumberRepresentable, IntegerLocalizable {

    public func asNSNumber() -> NSNumber {
        return self as NSNumber
    }
}

extension UInt32: NSNumberRepresentable, IntegerLocalizable {

    public func asNSNumber() -> NSNumber {
        return self as NSNumber
    }
}

extension Int64: NSNumberRepresentable, IntegerLocalizable {

    public func asNSNumber() -> NSNumber {
        return self as NSNumber
    }
}

extension Int: NSNumberRepresentable, IntegerLocalizable {

    public func asNSNumber() -> NSNumber {
        return self as NSNumber
    }
}

extension UInt: NSNumberRepresentable, IntegerLocalizable {

    public func asNSNumber() -> NSNumber {
        return self as NSNumber
    }
}

extension Float: NSNumberRepresentable, FloatingPointLocalizable {

    public func asNSNumber() -> NSNumber {
        return self as NSNumber
    }
}

extension Double: NSNumberRepresentable, FloatingPointLocalizable {

    public func asNSNumber() -> NSNumber {
        return self as NSNumber
    }
}
