# Release Notes


## 3.0.0

This version adds a bunch of extended iOS13/SwiftUI/Combine-specific logic.

* `Image+Keyboard` contains more keyboard-specific icons. 
* `KeyboardGridRow` has been deleted and replaced with an `HStack`.
* `KeyboardSetting` can resolve a unique key for an `Identifiable` context.
* `PersistedKeyboardSetting` can resolve a unique key for an `Identifiable` context.

The new `Gestures` and `System` namespace help you build native-imitating keyboards:
* Use `keyboardAction` view modifier to apply action-specific gestures to any view.
* Use `systemKeyboardButtonStyle` to apply a system keyboard button look to any view.
* You can also use the many extensions within these namespaces to build custom views.

There are new keyboard views:
* `SystemKeyboardBottomRow` mimics the bottommost row in a system keyboard.
* `SystemKeyboardButton` mimics a system keyboard button.
* `SystemKeyboardButtonRow` mimics a row in a system keyboard.
* `SystemKeyboardStyle` defines a style for system keyboards.
* `SystemKeyboardVStack` is a VStack that applies the correct system keyboard style.
* `AlphabeticSystemKeyboard` mimics an alphabetical system keyboard.
* `NumericSystemKeyboard` mimics a numeric system keyboard.
* `SymbolicSystemKeyboard` mimics a symbolic system keyboard.

Breaking changes:
* `View` `withClearInteractableBackground` has been renamed to `clearInteractableBackground`. 


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
