<p align="center">
    <img src ="Resources/Logo.png" width=600 />
</p>

<p align="center">
    <img src="https://img.shields.io/github/v/release/danielsaidi/KeyboardKitSwiftUI?color=%2300550&sort=semver" alt="Version" />
    <img src="https://img.shields.io/cocoapods/p/KeyboardKitSwiftUI.svg?style=flat" alt="Platform" />
    <img src="https://img.shields.io/badge/Swift-5.3-orange.svg" alt="Swift 5.3" />
    <img src="https://img.shields.io/github/license/danielsaidi/KeyboardKitSwiftUI" alt="MIT License" />
    <a href="https://twitter.com/danielsaidi">
        <img src="https://img.shields.io/badge/contact-@danielsaidi-blue.svg?style=flat" alt="Twitter: @danielsaidi" />
    </a>
</p>


## About KeyboardKitSwiftUI

`KeyboardKitSwiftUI` extends [KeyboardKit][KeyboardKit] with `SwiftUI` support.  It's temporarily a separate project, since SwiftUI requires iOS 13 and KeyboardKit targets iOS 11.

SwiftUI support is currently an `experimental feature`, where I work on finding a good fit with the main library. To be able to move swiftly (pun intended) and not get stuck with a bunch of deprecations and migrations, I will allow breaking changes between minor versions.

This library will become a part of the main library in v `4.0`. After that, semver will apply to the SwiftUI parts as well.

The SwiftUI approach will completely replace UIKit in v `4.0`. [Read more about this decision here][Post].


## Installation

### Swift Package Manager
```
https://github.com/danielsaidi/KeyboardKitSwiftUI.git
```

### CocoaPods

```ruby
target 'MyApp' do
  pod 'KeyboardKit'
  pod 'KeyboardKitSwiftUI'
end

target 'MyKeyboard' do
  pod 'KeyboardKit'
  pod 'KeyboardKitSwiftUI'
end
```


## Contact me

Feel free to reach out if you have questions or if you want to contribute in any way:

* E-mail: [daniel.saidi@gmail.com][Email]
* Twitter: [@danielsaidi][Twitter]
* Web site: [danielsaidi.com][Website]


## Clients

KeyboardKit is proudly supported by:

<a href="http://anomaly.net.au">
    <img src="Resources/logos/anomaly.png" alt="Anomaly Software Logo" title="Anomaly Software" width=150 />
</a>
<a href="https://www.milocreative.com">
    <img src="Resources/logos/milo.png" alt="Milo Creative Logo" title="Milo Creative" width=150 />
</a>

Your company can support KeyboardKit by either sponsoring the project on GitHub Sponsors or by paying for consultation.  I'ld be happy to help you out with your keyboard needs.


## License

KeyboardKitSwiftUI is available under the MIT license. See LICENSE file for more info.


[Email]: mailto:daniel.saidi@gmail.com
[Twitter]: http://www.twitter.com/danielsaidi
[Website]: http://www.danielsaidi.com

[KeyboardKit]: https://github.com/danielsaidi/KeyboardKit
[Post]: https://danielsaidi.com/blog/2021/01/15/removing-uikit-support-in-keyboardkit
