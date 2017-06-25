<div style="text-align:center">
 <img width="75%" src="https://raw.githubusercontent.com/Decybel07/L10n-swift/master/Images/Logo.png" alt="L10n-swift"/>
</div>


[![Build Status](https://travis-ci.org/Decybel07/L10n-swift.svg?branch=master&style=flat)](https://travis-ci.org/Decybel07/L10n-swift)
[![CocoaPods Version](https://img.shields.io/cocoapods/v/L10n-swift.svg?style=flat&label=version)](http://cocoapods.org/pods/L10n-swift)
[![Language Swift3](https://img.shields.io/badge/languages-Swift%203.0+-FFAC45.svg?style=flat)](https://developer.apple.com/swift/) 
[![CocoaPods Platform](https://img.shields.io/cocoapods/p/L10n-swift.svg?style=flat&label=platform)](http://cocoapods.org/pods/L10n-swift)
[![CocoaPods License](https://img.shields.io/cocoapods/l/L10n-swift.svg?style=flat&label=license)](https://github.com/Decybel07/L10n-swift/blob/master/LICENSE)
[![Docs percent](https://img.shields.io/badge/docs-100%25-brightgreen.svg)](http://cocoadocs.org/docsets/L10n-swift/)
[![Pod method Compatible](https://img.shields.io/badge/supports-CocoaPods%20%7C%20Carthage%20%7C%20Swift%20Package%20Manager-green.svg?style=flat)](#-installation)
[![codebeat badge](https://codebeat.co/badges/5f83f891-8cd6-4b12-9340-562a74c51442)](https://codebeat.co/projects/github-com-decybel07-l10n-swift-master)
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/3063467ecae74021b7666787333eac54)](https://www.codacy.com/app/Decybel07/L10n-swift/dashboard)

L10n-swift is a simple framework that improves localization in swift app, providing cleaner syntax and in-app language switching.

##  Overview

<div style="text-align:center">
<table width="90%"><tr>
 <td rowspan="2"><img src="https://raw.githubusercontent.com/Decybel07/L10n-swift/master/Images/L10n-swift.gif" alt="L10n-swift"/></td>
 <td><img src="https://raw.githubusercontent.com/Decybel07/L10n-swift/master/Images/plist.png?raw=true" alt="Plist"/></td>
</tr><tr>
 <td><img src="https://raw.githubusercontent.com/Decybel07/L10n-swift/master/Images/stringsdict.png?raw=true" alt="Stringsdict"/></td>
</tr></table>
</div>

## 🌟 Features
 
- [x] Change the language of your apps "on the fly".
- [x] Support for user-defined *Localizable* file names.
- [x] Support for stantard localization keys `.strings`.
- [x] Support for grouping localization keys `.plist` and `.stringsdict`.
- [x] Supports plural forms in any language `.stringsdict`.
- [x] Use .l10n() to localized any string, int and double.

## 💻 Demo

```ruby
pod try L10n-swift
```

## ⚠️ Requirements
 
 - iOS 9.0+ | macOS 10.10+ | tvOS 9.0+ | watchOS 2.0+
 - Swift 3.0+

## 👥 Communication

 - If you **found a bug**, open an issue.
 - If you **have a feature request**, open an issue.
 - If you **want to contribute**, submit a pull request.

## 📗 Installation

### [CocoaPods](http://cocoapods.org)
 
 ```ruby
 pod 'L10n-swift', '~> 3.0'
 ```
 
### [Carthage](https://github.com/Carthage/Carthage)

```ogdl
github "Decybel07/L10n-swift", ~> 3.0
```

### [Swift Package Manager](https://swift.org/package-manager/)

```swift
.Package(url: "https://github.com/Decybel07/L10n-swift.git", majorVersion: 3)
```

## 📘 [Usage](http://cocoadocs.org/docsets/L10n-swift/)

 Import L10n at the top of each Swift file that will use framework.
 ```swift
 import L10n
 ```
 
### Get localized text

 Add `.l10()` following any `String` object you want localized:
 ```swift
 textLabel.text = "HelloWorld".l10n()
 ```
 
### Get localized number

 Add `.l10()` following any `Int` or `Double` object you want localized using the number format for the current language:
 ```swift
 textLabel.text = 24.l10n()
 textLabel.text = 1.61803.l10n()
 textLabel.text = 2.71828.l10n(fractionDigits: 2)
 ```
 
### Get plural

Add `.l10(_ args: CVarArg...)` following any `String` object you want translated with plurals:
 ```swift
 textLabel.text = "numberOfApples".l10n(10)
 ```
 
### Observe language changed

 Add observer for notification `L10nLanguageChanged` This notification is called when language has been changed
 ```swift
 NotificationCenter.default.addObserver(self, selector: #selector(self.yourFunction), name: .L10nLanguageChanged, object: nil)
 ```

### Set language

 ```swift
 L10n.shared.language = "en"
 ```
 At runtime, you can switch the language at any time by setting the language property
 
### Get current language

 ```swift
 L10n.shared.language //  "en"
 ```
 
### Get locale for current language

 ```swift
 L10n.shared.locale
 ```

### Get list of supported languages

 ```swift
 L10n.supportedLanguages // ["en", "es", "ja", "pl"]
 ```
 A list of all the languages contained in the main bundle.

### Get preferred language

 ```swift
 L10n.preferredLanguage // "en"
 ```
 A preferred language contained in the main bundle

## 🤓 Author

Adrian Bobrowski ([Decybel07](https://github.com/Decybel07)), adrian071993@gmail.com

## 🔑 License

L10n-swift is available under the MIT license. See the [LICENSE](https://github.com/Decybel07/L10n-swift/blob/master/LICENSE) file for more info.
