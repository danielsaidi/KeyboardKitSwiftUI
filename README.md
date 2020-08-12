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

It's temporarily a separate framework, since Xcode can't handle iOS 13 features in a framework that targets iOS 11. 

When this is fixed or this project stops supporting iOS 11 and 12, this library will be added to `KeyboardKit`.


## SwiftUI Support

`KeyboardKitSwiftUI` has helps you build `KeyboardKit`-based keyboard extensions in SwiftUI.

To setup a keyboard extension to use `KeyboardKitSwiftUI`, and set up your input view controller with  `setup<Content: View>(with view: Content)`. It takes a custom `SwiftUI` `View` and will use this view to resize the extension. This will also setup the keyboard with an `ObservableKeyboardContext` and a standard keyboard style.

You can then add any views you want to the keyboard view and use the rich set of extensions and utilities that this library provides.

* `Context` contains an observable context and SwiftUI-specific context extensions.
* `Extensions` contains SwiftUI-specific extensions.
* `Gestures` contains SwiftUI-specific keyboard gestures. 
* `Settings` contains SwiftUI-specific settings extensions.
* `System` contains views and extensions that helps you create system keyboard mimicking keyboards..
* `Toast` contains SwiftUI-specific components to show a toast on top of a keyboard extension.
* `Views` contains SwiftUI-specific keyboard views.

You can read about some of this in the main project's readme collection. 


## How to create keyboards with SwiftUI

There is no magic to using this library with SwiftUI. You can use any views you like, and just let them trigger actions when they are tapped, pressed etc.

However, this repo has a bunch of views and utilities to help you simplify this. This is stil very much a work in progress, but my goal is to have great SwiftUI support in KeyboardKit 4.0. So far, the support is pretty basic. 

Basically, you can create keyboards in a wide variety of ways:

* Use any `SwiftUI` views and manually call the action handler when they are tapped, pressed etc.
* Use any `SwiftUI` views and use `View+KeyboardGestures` to trigger any functions when they are tapped, pressed etc.
* Use any `SwiftUI` views and use `View+KeyboardAction` to apply a certain keyboard action to the view.
* Use any `SwiftUI` views and use `View+System` to apply various system look and feel to them, e.g. `systemKeyboardButtonStyle`.
* Use `SystemKeyboardButton` to create buttons that try to mimic the native look and feel for the provided keyboard action.
* Use any of the many views in the `Views` namespace to create more complex keyboards.

Note that the `System` namespace is intended to build keyboards that resemble system keyboards. They currently provide little customizations.


## Demo application

There is a SwiftUI-specific demo keyboard in the main `KeyboardKit` repository. 

To try it out, run the demo project, enabe the SwiftUI keyboard in settings and you're good to go.   


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
