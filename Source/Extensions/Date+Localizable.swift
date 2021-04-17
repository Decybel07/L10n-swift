//
//  Date+Localizable.swift
//  L10n_swift
//
//  Created by Adrian Bobrowski on 29.07.2017.
//  Copyright © 2017 Adrian Bobrowski (Decybel07), adrian071993@gmail.com. All rights reserved.
//

import Foundation

extension Date: Localizable {

    /**
     Returns a localized `self` description.

     - parameter instance: The instance of `L10n` used for localization.
     */
    public func l10n(_ instance: L10n) -> String {
        return self.l10n(instance, dateStyle: .medium, timeStyle: .medium, formattingContext: nil)
    }
    
    /**
     Returns a localized `self` description.

     - parameter instance: The instance of `L10n` used for localization.
     - parameter formattingContext: A formatting context used to configure the `DateFormatter.formattingContext`.     
     */
    public func l10n(_ instance: L10n, formattingContext: Formatter.Context?) -> String {
        return self.l10n(instance, dateStyle: .medium, timeStyle: .medium, formattingContext: formattingContext)
    }

    /**
     Returns a localized `self` description.

     - parameter instance: The instance of `L10n` used for localization.
     - parameter dateStyle: A style used to configure the `DateFormatter.dateStyle`.
     - parameter formattingContext: A formatting context used to configure the `DateFormatter.formattingContext`.
     */
    public func l10n(_ instance: L10n = .shared, dateStyle: DateFormatter.Style, formattingContext: Formatter.Context? = nil) -> String {
        return self.l10n(instance, dateStyle: dateStyle, timeStyle: .none, formattingContext: formattingContext)
    }

    /**
     Returns a localized `self` description.

     - parameter instance: The instance of `L10n` used for localization.
     - parameter timeStyle: A style used to configure the `DateFormatter.timeStyle`.
     - parameter formattingContext: A formatting context used to configure the `DateFormatter.formattingContext`.
     */
    public func l10n(_ instance: L10n = .shared, timeStyle: DateFormatter.Style, formattingContext: Formatter.Context? = nil) -> String {
        return self.l10n(instance, dateStyle: .none, timeStyle: timeStyle, formattingContext: formattingContext)
    }

    /**
     Returns a localized `self` description.

     - parameter instance: The instance of `L10n` used for localization.
     - parameter dateStyle: A style used to configure the `DateFormatter.dateStyle`.
     - parameter timeStyle: A style used to configure the `DateFormatter.timeStyle`.
     - parameter formattingContext: A formatting context used to configure the `DateFormatter.formattingContext`.
     */
    public func l10n(_ instance: L10n = .shared, dateStyle: DateFormatter.Style, timeStyle: DateFormatter.Style, formattingContext: Formatter.Context? = nil) -> String {
        return self.l10n(instance) { formatter in
            formatter.dateStyle = dateStyle
            formatter.timeStyle = timeStyle
            formatter.formattingContext = formattingContext ?? formatter.formattingContext
        }
    }

    /**
     Returns a localized `self` description.

     - parameter instance: The instance of `L10n` used for localization.
     - parameter template: A template used to configure the `DateFormatter.dateFormat`.
     - parameter formattingContext: A formatting context used to configure the `DateFormatter.formattingContext`.
     */
    public func l10n(_ instance: L10n = .shared, template: String, formattingContext: Formatter.Context? = nil) -> String {
        return self.l10n(instance) { formatter in
            formatter.dateFormat = DateFormatter.dateFormat(fromTemplate: template, options: 0, locale: instance.locale)
            formatter.formattingContext = formattingContext ?? formatter.formattingContext
        }
    }
    
    /**
     Returns a localized `self` description.

     - parameter instance: The instance of `L10n` used for localization.
     - parameter staticFormat: A format used to configure the `DateFormatter.dateFormat`.
     - parameter formattingContext: A formatting context used to configure the `DateFormatter.formattingContext`.
     */
    public func l10n(_ instance: L10n = .shared, format: String, formattingContext: Formatter.Context? = nil) -> String {
        return self.l10n(instance) { formatter in
            formatter.dateFormat = format
            formatter.formattingContext = formattingContext ?? formatter.formattingContext
        }
    }

    /**
     Returns a localized `self` description.

     - parameter instance: The instance of `L10n` used for localization.
     - parameter closure: A closure used to configure the `DateFormatter`.

     - returns: A localized `self` description.
     */
    public func l10n(_ instance: L10n = .shared, closure: (_ formatter: DateFormatter) -> Void) -> String {
        let formatter = DateFormatter()
        formatter.locale = instance.locale
        closure(formatter)
        return formatter.string(from: self)
    }
}
