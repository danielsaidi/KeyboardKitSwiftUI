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


# Important information

This repository is being merged into [KeyboardKit][KeyboardKit] and will be a part of the main repo in  `4.0`. It will be around until KeyboardKit `5.0` is released, for all those who are still on `3.x`, then removed. It will not be developed further.


## About KeyboardKitSwiftUI

`KeyboardKitSwiftUI` extends [KeyboardKit][KeyboardKit] with SwiftUI support.  It's temporarily a separate project, since SwiftUI requires iOS 13 and KeyboardKit targets iOS 11.

This library will become a part of the main library in v `4.0`, and will then completely replace UIKit, which will no longer be supported. [Read more about this decision here.][Post]


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


## Sponsors and Clients

This project is proudly sponsored by the following individuals and companies:

* [@booch](https://github.com/booch)

<a href="http://anomaly.net.au">
    <img src="Resources/logos/anomaly.png" alt="Anomaly Software Logo" title="Anomaly Software" width=150 />
</a>
<a href="https://www.milocreative.com">
    <img src="Resources/logos/milo.png" alt="Milo Creative Logo" title="Milo Creative" width=150 />
</a>

You can support my work by sponsoring the project on [GitHub Sponsors][Sponsors] or hiring me for consultation. I'd be happy to help you out in any way that I can.


## License

KeyboardKitSwiftUI is available under the MIT license. See LICENSE file for more info.


[Email]: mailto:daniel.saidi@gmail.com
[Twitter]: http://www.twitter.com/danielsaidi
[Website]: http://www.danielsaidi.com
[Sponsors]: https://github.com/sponsors/danielsaidi

[KeyboardKit]: https://github.com/danielsaidi/KeyboardKit
[Post]: https://danielsaidi.com/blog/2021/01/15/removing-uikit-support-in-keyboardkit

[Anomaly]: http://anomaly.net.au
[Milo]: https://www.milocreative.com
