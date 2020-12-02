# Release Notes


## 3.2.0

This release contains layout improvements.

* The introduction of `input sets` and `keyboard layouts` will drastically change how button layout must be handled.
* There is a new `SystemKeyboard` that takes a keyboard layout. It's more flexible than the previous keyboards, which now are deprecated.
* Due to this, many system views are deprecated and the system keyboard style will become obsolete.

Removing the system keyboard style will however happen over a longer period, and will be complete until KeyboardKit 4.0.

### Important

`SystemKeyboardStyle` has a todo that explains why it will gradually be replaced until KeyboardKit 4.0.

### Deprecations

* `AlphabeticSystemKeyboard`
* `NumericSystemKeyboard`
* `SymbolicSystemKeyboard`
* `SystemKeyboardBottomRow`
* `SystemKeyboardVStack`


## 3.1.3

This version fixes a bug where the long press action of a `KeyboardImageButton` didn't do anything.


## 3.1.2

This version makes the `View+Geometry` extension internal.

If you use it, consider copying it from [SwiftUIKit](https://github.com/danielsaidi/SwiftUIKit).


## 3.1.1

This version makes the `.emojiCategory` action use a clear interactable background for system buttons.


## 3.1.0

This version adds new autocomplete tools:

* `ObservableAutocompleteContext` can be used to bind autocomplete results to views.
* `AutocompleteToolbar` is a customizable toolbar for displaying autocomplete results.

The toolbar uses the new observable context to populate itself with suggestions.


## 3.0.3

This version improves the documentation and adds more configuration options to some views.


## 3.0.2

This version improves the documentation and fixes an invalid package reference.


## 3.0.1

This version fixes a bug where the demo keyboard globe button didn't do anything.

This version also adjusts the font weight of system button images.


## 3.0.0

This version adds a bunch of extended iOS13/SwiftUI/Combine-specific logic.

There are a lot more not covered in these release notes or in the readme, but I've tried to apply most things in the demo.

* `ObservableKeyboardContext` contains more information.
* `Image+Keyboard` contains more keyboard-specific icons. 
* `KeyboardGridRow` has been deleted and replaced with an `HStack`.
* `KeyboardSetting` can resolve a unique key for an `Identifiable` context.
* `PersistedKeyboardSetting` can resolve a unique key for an `Identifiable` context.

The new `Gestures` and `System` namespace help you build native-imitating keyboards:

* `View+keyboardAction` applies keyboard action-specific gestures to any view.
* `View+keyboardGestures` applies keyboard-specific gestures to any view.
* The various `+system` extensions apply a system keyboard logic to various types.

* You can also use the many extensions within these namespaces to build custom views.

There are new `System` mimicking keyboard views:

* `SystemKeyboardBottomRow` mimics the bottommost row in a system keyboard.
* `SystemKeyboardButton` mimics a system keyboard button.
* `SystemKeyboardButtonRow` mimics a row in a system keyboard.
* `SystemKeyboardStyle` defines a style for system keyboards.
* `SystemKeyboardVStack` is a VStack that applies the correct system keyboard style.
* `AlphabeticSystemKeyboard` mimics an alphabetical system keyboard.
* `NumericSystemKeyboard` mimics a numeric system keyboard.
* `SymbolicSystemKeyboard` mimics a symbolic system keyboard.

There is a new `Toast` namespace that contains utils to show toast messages above a keyboard. 

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
