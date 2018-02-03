<p align="center">
 <img width="75%" src="https://raw.githubusercontent.com/Decybel07/L10n-swift/master/Images/Logo.png" alt="L10n-swift"/>
</p>


[![Build Status](https://travis-ci.org/Decybel07/L10n-swift.svg?branch=master&style=flat)](https://travis-ci.org/Decybel07/L10n-swift)
[![CocoaPods Version](https://img.shields.io/cocoapods/v/L10n-swift.svg?style=flat&label=version)](http://cocoapods.org/pods/L10n-swift)
[![Language Swift3](https://img.shields.io/badge/languages-Swift%203.0+-FFAC45.svg?style=flat)](https://developer.apple.com/swift/) 
[![CocoaPods Platform](https://img.shields.io/cocoapods/p/L10n-swift.svg?style=flat&label=platform)](http://cocoapods.org/pods/L10n-swift)
[![CocoaPods License](https://img.shields.io/cocoapods/l/L10n-swift.svg?style=flat&label=license)](https://github.com/Decybel07/L10n-swift/blob/master/LICENSE)
[![Docs percent](https://img.shields.io/badge/docs-100%25-brightgreen.svg)](http://cocoadocs.org/docsets/L10n-swift/)
[![Pod method Compatible](https://img.shields.io/badge/supports-CocoaPods%20%7C%20Carthage%20%7C%20Swift%20Package%20Manager-green.svg?style=flat)](#-installation)
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/3063467ecae74021b7666787333eac54)](https://www.codacy.com/app/Decybel07/L10n-swift/dashboard)
[![codebeat badge](https://codebeat.co/badges/5f83f891-8cd6-4b12-9340-562a74c51442)](https://codebeat.co/projects/github-com-decybel07-l10n-swift-master)
[![Mentioned in Awesome-swift](https://awesome.re/mentioned-badge.svg)](https://github.com/matteocrippa/awesome-swift)


L10n-swift is a simple framework that improves localization in swift app, providing cleaner syntax and in-app language switching.

##  Overview

<p align="center">
<table><tr>
 <td><img src="https://raw.githubusercontent.com/Decybel07/L10n-swift/master/Images/language720.gif" alt="Change language"/></td>
 <td><img src="https://raw.githubusercontent.com/Decybel07/L10n-swift/master/Images/translator720.gif" alt="Simple translator"/></td>
 <td><img src="https://raw.githubusercontent.com/Decybel07/L10n-swift/master/Images/plurals720.gif" alt="Plurals"/></td>
</tr></table>
</p>

## 🌟 Features

- [x] Change the language of your apps "on the fly".
- [x] IBInspectable for Xcode Interface Builder (Cocoa - coming soon).
- [x] Support for user-defined `Localizable` file names.
- [x] Support for formats: [`*.plist`](https://github.com/Decybel07/L10n-swift/wiki/*.plist), [`*.json`](https://github.com/Decybel07/L10n-swift/wiki/*.json), [`*.stringsdict`](https://github.com/Decybel07/L10n-swift/wiki/*.stringsdict), [`*.strings`](https://github.com/Decybel07/L10n-swift/wiki/*.strings).
- [x] Support for grouping localization keys.
- [x] Support for [**plural**](https://github.com/Decybel07/L10n-swift/wiki/Plural) forms in any language.
- [x] Use `.l10n()` to localized any string, date, int and double.
- [x] Use more than one languages at the same time.
- [x] About 25 times faster than a native solution.

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

|                          | Core | Extension | IBInspectable |
|--------------------------|:----:|:---------:|:-------------:|
| L10n-swift               |  ✔️  |     ✔️    |       ✔️     |
| L10n-swift/Core          |  ✔️  |           |               |
| L10n-swift/Extension     |  ✔️  |     ✔️    |               |
| L10n-swift/IBInspectable |  ✔️  |           |       ✔️      |

### [CocoaPods](http://cocoapods.org)
 
 ```ruby
 pod 'L10n-swift', '~> 4.1' # swift3
 pod 'L10n-swift', '~> 5.1' # swift4
 ```
 
### [Carthage](https://github.com/Carthage/Carthage)

```ogdl
github "Decybel07/L10n-swift", ~> 4.1 # swift3
github "Decybel07/L10n-swift", ~> 5.1 # swift4
```

### [Swift Package Manager](https://swift.org/package-manager/)

```swift
.Package(url: "https://github.com/Decybel07/L10n-swift.git", majorVersion: 4) // swift3
.Package(url: "https://github.com/Decybel07/L10n-swift.git", majorVersion: 5) // swift4
```

## 📘 [Usage](http://cocoadocs.org/docsets/L10n-swift/)

 Import L10n_swift at the top of each Swift file that will use framework.
 ```swift
 import L10n_swift
 ```
 
### Get localized text

 Add `.l10()` following any `String` object you want localized:
 ```swift
 "HelloWorld".l10n()
 ```
 
### Get localized number

 Add `.l10()` following any `Int`,  `Double` or `NSNumber` object you want localized using the number format for the current language:
 ```swift
 12.l10n()
 24.l10n(minIntegerDigits: 4)
 1.61803.l10n()
 2.71828.l10n(fractionDigits: 2)
 
 3.14.l10n { formatter in
     formatter.numberStyle = .currency
 }
 ```
 
 ### Get localized date
 
 Add `.l10()` following any `Date`  object you want localized using the number format for the current language:
 ```swift
 Date().l10n()
 
 Date().l10n { formatter in
     formatter.dateStyle = .medium
 }
 ```
 
### Get plural

Add `.l10(arg: CVarArg)` following any `String` object you want translated with plurals:
 ```swift
 "numberOfApples".l10n(arg: 2)
 ```
 More about plurals, you can read on [**wiki**](https://github.com/Decybel07/L10n-swift/wiki/Plural)
 
### Observe language changed

 Add observer for notification `L10nLanguageChanged` This notification is called when language has been changed
 ```swift
 NotificationCenter.default.addObserver(
     self, selector: #selector(self.yourFunction), name: .L10nLanguageChanged, object: nil
 )
 ```

### Set language

 ```swift
 L10n.shared.language = "en"
 L10n.shared.language = "en-GB"
 ```
 At runtime, you can switch the language at any time by setting the language property
 
### Get current language

 ```swift
 L10n.shared.language
 ```
 
### Get locale for current language

 ```swift
 L10n.shared.locale
 ```

### Get list of supported languages

 ```swift
 L10n.supportedLanguages
 ```
 A list of all the languages contained in the main bundle.

### Get preferred language

 ```swift
 L10n.preferredLanguage
 ```
 A preferred language contained in the main bundle

### Supported formats
#### .plist, .stringsdict
<img src="https://raw.githubusercontent.com/Decybel07/L10n-swift/master/Images/sample_plist_file.png" alt="Sample .plist and .stringsdict file" width="597" style="max-width:100%;"/>

 More about **.plist** format you can read on [**wiki**](https://github.com/Decybel07/L10n-swift/wiki/*.plist)
 
 More about **.stringsdict** format you can read on [**wiki**](https://github.com/Decybel07/L10n-swift/wiki/*.stringsdict)
 
 #### .json
 <img src="https://raw.githubusercontent.com/Decybel07/L10n-swift/master/Images/sample_json_file.png" alt="Sample .json file" width="554" style="max-width:100%;"/>
 
 More about **.json** format you can read on [**wiki**](https://github.com/Decybel07/L10n-swift/wiki/*.json)
 
 #### .strings
 <img src="https://raw.githubusercontent.com/Decybel07/L10n-swift/master/Images/sample_strings_file.png" alt="Sample .strings file" width="544" style="max-width:100%;"/>
 
 More about **.strings** format you can read on [**wiki**](https://github.com/Decybel07/L10n-swift/wiki/*.strings).

## 📙 [FAQ](https://github.com/Decybel07/L10n-swift/wiki/FAQ)

## 🤓 Author

Adrian Bobrowski ([Decybel07](https://github.com/Decybel07)), adrian071993@gmail.com

## 🔑 License

L10n-swift is available under the MIT license. See the [LICENSE](https://github.com/Decybel07/L10n-swift/blob/master/LICENSE) file for more info.
