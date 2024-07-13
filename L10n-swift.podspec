
Pod::Spec.new do |spec|
  spec.name             = 'L10n-swift'
  spec.module_name      = 'L10n_swift'
  spec.version          = '5.10.3'
  spec.summary          = 'Localization of an application with ability to change language "on the fly" and support for plural forms in any language.'

  spec.description      = <<-DESC
    L10n-swift is a pod that adds easier localization support for your app
      * Change the language of your apps "on the fly".
      * IBInspectable for Xcode Interface Builder.
      * Support for user-defined `Localizable` file names.
      * Support for formats: `*.plist`, `*.json`, `*.stringsdict`, `*.strings`.
      * Support for grouping localization keys.
      * Support for plural forms in any language with multiple arguments.
      * Support for pseudo-languages: `NonLocalized`, `DoubleLength`, `Accented`, `Bounded`, `ForcedRightToLeft`.
      * Use .l10n() to localized any string, date and numbers.
      * Use more than one languages at the same time.
                       DESC

  spec.homepage         = 'https://github.com/Decybel07/L10n-swift'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Adrian Bobrowski' => 'adrian071993@gmail.com' }
  spec.source           = { :git => "https://github.com/Decybel07/L10n-swift.git", :tag => spec.version }

  spec.frameworks = 'Foundation'
  spec.swift_versions = ['4.0', '4.2', '5']

  spec.ios.deployment_target = '9.0'
  spec.watchos.deployment_target = '2.0'
  spec.tvos.deployment_target = '9.0'
  spec.osx.deployment_target = '10.10'
  
  spec.subspec 'Core' do |core|
    core.source_files = 'Source/Core/**/*.{swift,stringsdict}'
  end
  
  spec.subspec 'Extension' do |extension|
    extension.dependency 'L10n-swift/Core'
    extension.source_files = 'Source/Extensions/**/*.swift'
  end
  
  spec.subspec 'IBInspectable' do |inspectable|
    inspectable.dependency 'L10n-swift/Core'
    inspectable.source_files = 'Source/IBInspectables/Core/**/*.swift'
    
    inspectable.ios.framework  = 'UIKit'
    inspectable.ios.source_files = 'Source/IBInspectables/UIKit/{Common,iOS}/**/*.swift'
    
    inspectable.watchos.framework  = 'WatchKit'
    inspectable.watchos.source_files = 'Source/IBInspectables/WatchKit/**/*.swift'
    
    inspectable.tvos.framework  = 'UIKit'
    inspectable.tvos.source_files = 'Source/IBInspectables/UIKit/{Common,tvOS}/**/*.swift'
    
#    inspectable.osx.framework  = 'Cocoa'
#    inspectable.osx.source_files = 'Source/IBInspectables/Cocoa/**/*.swift'
  end
  
end
