# Run `pod lib lint' to ensure this is a valid spec.

Pod::Spec.new do |s|
  s.name             = 'KeyboardKitSwiftUI'
  s.version          = '3.0.1'
  s.swift_versions   = ['5.2']
  s.summary          = 'KeyboardKitSwiftUI adds SwiftUI support to KeyboardKit.'

  s.description      = <<-DESC
KeyboardKitSwiftUI makes it possible to build custom keyboard extensions in SwiftUI.
                       DESC

  s.homepage         = 'https://github.com/danielsaidi/KeyboardKitSwiftUI'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Daniel Saidi' => 'daniel.saidi@gmail.com' }
  s.source           = { :git => 'https://github.com/danielsaidi/KeyboardKitSwiftUI.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/danielsaidi'

  s.swift_version = '5.2'
  s.ios.deployment_target = '13.0'
  s.source_files = 'Sources/KeyboardKitSwiftUI/**/*.swift'

  s.dependency 'KeyboardKit', '~> 3.0.1'
end
