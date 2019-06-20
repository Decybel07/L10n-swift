
# Change Log
---

## [5.5.0](https://github.com/Decybel07/L10n-swift/tree/5.5.0) (2019-06-20)
* Support for multiple arguments in plural function [#16](https://github.com/Decybel07/L10n-swift/issues/16)

## [5.4.1](https://github.com/Decybel07/L10n-swift/tree/5.4.1) (2018-09-08)
* `Local` includes system settings for the region

## [5.4.0](https://github.com/Decybel07/L10n-swift/tree/5.4.0) (2018-07-11)
* Support for variant fitting presentation width

## [5.3.0](https://github.com/Decybel07/L10n-swift/tree/5.3.0) (2018-05-18)
* Support for base internacionalization [#12](https://github.com/Decybel07/L10n-swift/issues/12)
* Add extension to use strings with args  [#9](https://github.com/Decybel07/L10n-swift/issues/9)

## [5.2.1](https://github.com/Decybel07/L10n-swift/tree/5.2.1) (2018-05-06)
* Extracting classes that load files

## [5.2.0](https://github.com/Decybel07/L10n-swift/tree/5.2.0) (2018-04-25)
* Support for swift 3.0+
* Add supportings method for `Date`
* Possibility to define the Logger format

## [5.1.0](https://github.com/Decybel07/L10n-swift/tree/5.1.0) (2018-02-03)
* Added functionality of injecting dictionary from an external source (eg internet)

## [5.0.1](https://github.com/Decybel07/L10n-swift/tree/5.0.1) (2017-12-09)
* Improving performance for keys from `.strings` files

## [5.0.0](https://github.com/Decybel07/L10n-swift/tree/5.0.0) (2017-11-12)
* Support for `json` format.
* Faster access to localization keys.
* Plural only for one argument.
* All formats support plural (`zero`, `one`, `two`, `few`, `many`, `other` and `floating` for floating point numbers).
* Bugfix [#10](https://github.com/Decybel07/L10n-swift/issues/10).
* Improved [`README`](https://github.com/Decybel07/L10n-swift/blob/master/README.md)
* Improved [documentation](https://cocoadocs.org/docsets/L10n-swift).
* Created [wiki](https://github.com/Decybel07/L10n-swift/wiki).

## [4.2.0](https://github.com/Decybel07/L10n-swift/tree/4.2.0) (2017-10-01)
* Migrate to Swift 4.0.

## [4.1.3](https://github.com/Decybel07/L10n-swift/tree/4.1.3) (2017-09-12)
* Created example for Right-to-Left.

## [4.1.2](https://github.com/Decybel07/L10n-swift/tree/4.1.2) (2017-08-31)
* Bugfix [#6](https://github.com/Decybel07/L10n-swift/issues/6).

## [4.1.1](https://github.com/Decybel07/L10n-swift/tree/4.1.1) (2017-08-24)
* Implementation of the `Localizable` protocol for the `L10n`.

## [4.0.1](https://github.com/Decybel07/L10n-swift/tree/4.0.1) (2017-08-19)
* Created better example.
* Refactoring IBInspectable properties.
* Fixes typo.

## [4.0.0](https://github.com/Decybel07/L10n-swift/tree/4.0.0) (2017-07-30)
* IBInspectable for Xcode Interface Builder.
* Support for other bundle than main.
* Opened class L10n.
* Created protocol for logger.
* In extensions you can defnining which L10n instance will be used.
* Numbers can be convert to string using NumberFormatter configurated by user.
* Implemented `CustomStringConvertible` and `CustomDebugStringConvertible` for L10n class.
* Added `sender` in `userInfo` for notification `L10nLanguageChanged`.
* Created better tests.

## [3.0.1](https://github.com/Decybel07/L10n-swift/tree/3.0.1) (2017-06-30)
* Added `oldValue` and `newValue` in `userInfo` for notification `L10nLanguageChanged`.
* Bugfixing - missing `resource` parameter in string extension.
* Change framework logo.

## [3.0.0](https://github.com/Decybel07/L10n-swift/tree/3.0.0) (2017-06-25)
* Support for user-defined `Localizable` file names.

## [2.2.0](https://github.com/Decybel07/L10n-swift/tree/2.2.0) (2017-06-14)
* Create post notification when language has been changed.

## [2.1.2](https://github.com/Decybel07/L10n-swift/tree/2.1.2) (2017-06-05)
* Bugfixe and minor improvements.

## [2.1.1](https://github.com/Decybel07/L10n-swift/tree/2.1.1) (2017-06-03)
* Create `Localizable` protocol.
* add attention in documentation.

## [2.1.0](https://github.com/Decybel07/L10n-swift/tree/2.1.0) (2017-06-01)
* Support for localized NSNumber.

## [2.0.5](https://github.com/Decybel07/L10n-swift/tree/2.0.5) (2017-05-23)
* Bugfixing - localized integer as long integer.

## [2.0.4](https://github.com/Decybel07/L10n-swift/tree/2.0.4) (2017-05-23)
* Support for localized integer with leading zeros.

## [2.0.3](https://github.com/Decybel07/L10n-swift/tree/2.0.3) (2017-05-20)
* Create example for mac.

## [2.0.2](https://github.com/Decybel07/L10n-swift/tree/2.0.2) (2017-05-14)
* Create example for TV.
* Create example for watch.

## [2.0.1](https://github.com/Decybel07/L10n-swift/tree/2.0.1) (2017-05-11)
* Change iOS deployment target to 9.0.

## [2.0.0](https://github.com/Decybel07/L10n-swift/tree/2.0.0) (2017-05-11)
* Change the language of your apps "on the fly".
* Support for stantard localization key (Localizable.strings).
* Support for grouping localization keys (Localizable.plist and Localizable.stringsdict).
* Supports plural form in any language (Localizable.stringsdict).
* Use .l10n() to localized any string, int and double.
* Use two or more languages at the same time.
