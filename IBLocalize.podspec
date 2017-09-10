
Pod::Spec.new do |spec|
  spec.name             = 'IBLocalize'
  spec.module_name      = 'L10n_swift'
  spec.version          = '4.1.2'
  spec.summary          = 'Add IBInspectable to localize your app from Interface Builder. This framework base on `L10n-swift`'

  spec.description      = <<-DESC
    L10n-swift is a pod that adds easier localization support for your app
      * IBInspectable for Interface Builder.
      * Support for stantard localization keys `*.strings`
      * Support for grouping localization keys `*.plist` and `*.stringsdict`
      * Supports plural forms in any language `*.stringsdict`
      * Change the language of your apps "on the fly".
                       DESC

  spec.homepage         = 'https://github.com/Decybel07/L10n-swift'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Adrian Bobrowski' => 'adrian071993@gmail.com' }
  spec.source           = { :git => "https://github.com/Decybel07/L10n-swift.git", :tag => spec.version }

  spec.dependency 'L10n-swift/IBInspectable', "#{spec.version}"

  spec.ios.deployment_target = '9.0'
  spec.watchos.deployment_target = '2.0'
  spec.tvos.deployment_target = '9.0'
  spec.osx.deployment_target = '10.10'

end
