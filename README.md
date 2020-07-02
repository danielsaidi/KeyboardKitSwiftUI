<p align="center">
    <img src ="Resources/Logo.png" width=600 />
</p>

<p align="center">
    <a href="https://github.com/danielsaidi/KeyboardKitSwiftUI">
        <img src="https://badge.fury.io/gh/danielsaidi%2FKeyboardKitSwiftUI.svg?style=flat" alt="Version" />
    </a>
    <img src="https://img.shields.io/cocoapods/p/KeyboardKitSwiftUI.svg?style=flat" alt="Platform" />
    <img src="https://img.shields.io/badge/Swift-5.1-orange.svg" alt="Swift 5.1" />
    <img src="https://badges.frapsoft.com/os/mit/mit.svg?style=flat&v=102" alt="License" />
    <a href="https://twitter.com/danielsaidi">
        <img src="https://img.shields.io/badge/contact-@danielsaidi-blue.svg?style=flat" alt="Twitter: @danielsaidi" />
    </a>
</p>


## About KeyboardKitSwiftUI

`KeyboardKitSwiftUI` extends [KeyboardKit][KeyboardKit] with `SwiftUI` functionality. 

It's temporarily a separate framework, since Xcode can't handle iOS 13 features in a framework that targets iOS 11. When this is fixed, this library will be added to `KeyboardKit`.


## SwiftUI

`KeyboardKitSwiftUI` has tools and views that help you build `KeyboardKit`-based keyboard extensions in SwiftUI.

To setup a custom keyboard to be used with `SwiftUI`, import `KeyboardKitSwiftUI` and set up your input view controller with `setup<Content: View>(with view: Content)`. It takes a custom `SwiftUI` `View` and will use this view to resize the extension.

You can then add any views you want to the keyboard view. In `Views`, you can find some views that kan help kick-start your project.


## Demo application

There is a SwiftUI-specific demo keyboard in the main `KeyboardKit` repository. Just run the demo project, enabe the SwiftUI keyboard in system settings and yo're good to go.   


## Installation

### Swift Package Manager
```
https://github.com/danielsaidi/KeyboardKitSwiftUI.git
```

### CocoaPods

```ruby
target 'MyApp' do
  pod 'KeyboardKit'
end

target 'MyKeyboard' do
  pod 'KeyboardKit'
end
```


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
