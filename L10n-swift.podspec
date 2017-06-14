
Pod::Spec.new do |s|
  s.name             = 'L10n-swift'
  s.module_name      = 'L10n'
  s.version          = '2.2.0'
  s.summary          = 'Localization of an application with ability to change language "on the fly" and support for plural forms in any language.'

  s.description      = <<-DESC
    L10n is a pod that adds easier localization support for your app
      * Change the language of your apps "on the fly".
      * Support for stantard localization keys (Localizable.strings)
      * Support for grouping localization keys (Localizable.plist and Localizable.stringsdict)
      * Supports plural forms in any language (Localizable.stringsdict)
      * Use .l10n() to localized any string, int and double
                       DESC

  s.homepage         = 'https://github.com/Decybel07/L10n-swift'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Adrian Bobrowski' => 'adrian071993@gmail.com' }
  s.source           = { :git => "https://github.com/Decybel07/L10n-swift.git", :tag => s.version }

  s.ios.deployment_target = '9.0'
  s.osx.deployment_target = '10.10'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '2.0'

  s.source_files = 'Source/**/*.swift'
  s.frameworks = 'Foundation'
end
