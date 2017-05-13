# L10n-swift

[![Build Status](https://travis-ci.org/Decybel07/L10n-swift.svg?branch=master&style=flat)](https://travis-ci.org/Decybel07/L10n-swift)
[![Swift3 Compatible](https://img.shields.io/badge/swift-3-FFAC45.svg?style=flat)](https://developer.apple.com/swift/) 
[![codebeat badge](https://codebeat.co/badges/5f83f891-8cd6-4b12-9340-562a74c51442)](https://codebeat.co/projects/github-com-decybel07-l10n-swift-master)
[![CocoaPods Platform](https://img.shields.io/cocoapods/p/L10n.svg?style=flat)](http://cocoapods.org/pods/L10n-swift)
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/L10n-swift.svg=flat)](http://cocoapods.org/pods/L10n-swift)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Swift Package Manager Compatible](https://img.shields.io/badge/SPM-compatible-4BC51D.svg?style=flat)](https://github.com/apple/swift-package-manager)
[![CocoaPods License](https://img.shields.io/cocoapods/l/L10n.svg?style=flat)](http://cocoapods.org/pods/L10n-swift)

L10n is a simple framework that improves localization in swift apps - providing cleaner syntax and in-app language switching.

## Overview

<table align="center"><tr>
 <td rowspan="2"><img src="Screenshots/L10n-swift.gif?raw=true" alt="L10n-swift"/></td>
 <td><img src="Screenshots/plist.png?raw=true" alt="Plist"/></td>
</tr><tr>
 <td><img src="Screenshots/stringsdict.png?raw=true" alt="Stringsdict"/></td>
</tr></table>

## Features
 
 - Change the language of your apps "on the fly".
 - Support for stantard localization key (Localizable.strings)
 - Support for grouping localization keys (Localizable.plist and Localizable.stringsdict)
 - Supports plural form in any language (Localizable.stringsdict)
 - Use .l10n() to localized any string

## Demo

```ruby
pod try L10n-swift
```

## Requirements
 
 - iOS 9.0+ | macOS 10.10+ | tvOS 9.0+ | watchOS 2.0+
 - Swift 3.0+

## Communication

 - If you **found a bug**, open an issue.
 - If you **have a feature request**, open an issue.
 - If you **want to contribute**, submit a pull request.

## Installation

### Setting up with [CocoaPods](http://cocoapods.org)
 
 ```ruby
 pod 'L10n-swift', '~> 2.0'
 ```
 
 or alternative
 
 ```ruby
 pod 'L10n-swift', :git => 'https://github.com/Decybel07/L10n-swift.git'
 ```
 
### Setting up with [Carthage](https://github.com/Carthage/Carthage)

```ogdl
github "Decybel07/L10n-swift", ~> 2.0
```

### Setting up with [Package Manager](https://swift.org/package-manager/)

```swift
.Package(url: "https://github.com/Decybel07/L10n-swift.git", majorVersion: 2)
```

## Usage

 Import L10n at the top of each Swift file that will use framework.
 ```swift
 import L10n
 ```
 
### Get translated text

 Add `.l10()` following any `String` object you want translated:
 ```swift
 textLabel.text = "HelloWorld".l10n()
 ```
 
### Get plural

Add `.l10(_ args: CVarArg...)` following any `String` object you want translated with plurals:
 ```swift
 textLabel.text = "numberOfApples".l10n(10)
 ```
 
### Set current language

 ```swift
 L10n.shared.language = "en"
 ```
 At runtime, you can switch the language at any time by setting the language property
 
### Get current language

 ```swift
 L10n.shared.language //  "en"
 ```

### Get list of supported languages

 ```swift
 L10n.supportedLanguages // ["en", "es", "ja", "pl"]
 ```
 A list of all the languages contained in the main bundle.

### Get preferred languages

 ```swift
 L10n.preferredLanguage // "en"
 ```
 An ordered list of preferred languages contained in the main bundle

## Author

Adrian Bobrowski, adrian071993@gmail.com

## License

L10n is available under the MIT license. See the LICENSE file for more info.
