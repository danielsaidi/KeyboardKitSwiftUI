<p align="center">
    <img src ="Resources/Logo.png" width=600 />
</p>

<p align="center">
    <a href="https://github.com/danielsaidi/KeyboardKitSwiftUI">
        <img src="https://badge.fury.io/gh/danielsaidi%2FKeyboardKitSwiftUI.svg?style=flat" alt="Version" />
    </a>
    <img src="https://img.shields.io/cocoapods/p/KeyboardKitSwiftUI.svg?style=flat" alt="Platform" />
    <img src="https://img.shields.io/badge/Swift-5.3-orange.svg" alt="Swift 5.3" />
    <img src="https://badges.frapsoft.com/os/mit/mit.svg?style=flat&v=102" alt="License" />
    <a href="https://twitter.com/danielsaidi">
        <img src="https://img.shields.io/badge/contact-@danielsaidi-blue.svg?style=flat" alt="Twitter: @danielsaidi" />
    </a>
</p>


## About KeyboardKit

`KeyboardKit` is a helps you create custom keyboard extensions for `iOS` and `ipadOS`. It provides you with a rich set of `tools` and `actions`, `haptic` and `audio` feedback, `input sets`, `keyboard layouts` etc. and lets you create keyboards with `characters`, `numbers`, `symbols`, `emojis`, `images` or entirely custom ones.

You can create native looking keyboards like the example below, or completely custom keyboards:

<p align="center">
    <img src ="Resources/Demo.gif" width="300" />
</p>

`KeyboardKitSwiftUI` extends [KeyboardKit][KeyboardKit] with `SwiftUI` support. It's temporarily a separate project, since SwiftUI requires iOS 13 and KeyboardKit targets iOS 11. It'll become part of the main library in version `4.0`.

Read more about SwiftUI support in the [main repository][KeyboardKit].


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


## Important information

SwiftUI support is currently in development, where I use this separate library to find a good fit with the main library. As such, to be able to move swiftly (pun intended) and not struggle with a bunch of deprecations, I will allow breaking changes between minor versions.

This library will become a part of the main library in version `4.0`. After that, semver will apply to the SwiftUI parts as well.  


## Contact me

Feel free to reach out if you have questions or if you want to contribute in any way:

* E-mail: [daniel.saidi@gmail.com][Email]
* Twitter: [@danielsaidi][Twitter]
* Web site: [danielsaidi.com][Website]


## Supporters

KeyboardKit is proudly supported by:

[![Anomaly Software](Resources/logos/anomaly.png "Anomaly Software")](http://anomaly.net.au/)

Your company can support KeyboardKit by either sponsoring the project on GitHub Sponsors or by paying for consultation. I'ld be happy to help you out with your keyboard needs. 


## License

KeyboardKitSwiftUI is available under the MIT license. See LICENSE file for more info.


[Email]: mailto:daniel.saidi@gmail.com
[Twitter]: http://www.twitter.com/danielsaidi
[Website]: http://www.danielsaidi.com

[Carthage]: https://github.com/Carthage/Carthage
[CocoaPods]: https://cocoapods.org/

[KeyboardKit]: https://github.com/danielsaidi/KeyboardKit
