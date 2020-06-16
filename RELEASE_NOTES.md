# Release Notes


## 3.0.0

This version adds some iOS13/SwiftUI/Combine-specific logic.

* `KeyboardSetting` can resolve a unique key for an `Identifiable` context.
* `PersistedKeyboardSetting` can resolve a unique key for an `Identifiable` context.
* `Image+Keyboard` contains more keyboard-specific icons. 


## 2.9.0 - 2.7.2

This version updates external dependencies to their latest versions.


## 2.7.0

This version adds the very first (and so far limited) support for `SwiftUI`. Many new features are iOS 13-specific.

There are some new views that can be used in SwiftUI-based apps and keyboard extensions:

* `KeyboardGrid` distributes actions evenly within a grid.
* `KeyboardGridRow` is used for each row in the grid.
* `KeyboardHostingController` can be used to wrap any `View` in a keyboard extension.
* `KeyboardImageButton` view lets you show an `.image` action or `Image` in a `Button`.
* `NextKeyboardButton` sets itself up with a `globe` icon and works as a standard "next keyboard" button.
* `PersistedKeyboardSetting` is a new property wrapper for persisting settings in `UserDefaults`. 

* `Color.clearInteractable` can be used instead of `.clear` to allow gestures to be detected.
* `Image.globe` returns the icon that is used for "next keyboard".
* `KeyboardInputViewController` `setup(with:View)`  sets up a `KeyboardHostingController`.
* `View` `withClearInteractableBackground()` can be used to make an entire view interactable.
