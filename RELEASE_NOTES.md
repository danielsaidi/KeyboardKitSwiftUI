# Release Notes

SwiftUI support is currently an `experimental feature`, where I use this separate library to find a good fit with the main library. To be able to move swiftly (pun intended) and not get stuck with a bunch of deprecations and migrations, I will allow breaking changes between minor versions.

In `v4.0`, this library will become a part of the main library. After that, semver will apply to the SwiftUI parts as well. 


## 3.6.0

### New features

* `AutocompleteToolbar` has a new, static  `standardReplacement` function.
* `AutocompleteToolbar` has a new, static  `standardReplacementAction` function.
* `AutocompleteToolbar` now lets you provide an optional, custom  `replacementAction` in init.
* `EmojiKeyboard` is a new view that renders a set of emojis in a lazy grid. The item action is customizable.

### Deprecations

* `View+keyboardAction(:context:)` has been deprecated. 


## 3.5.2

This release fixes so that the secondary input gesture triggers a tap if there were no secondary actions in the callout.

The release also makes the entire autocomplete button tappable, instead of just the text.


## 3.5.1

This release fixes so that upper-cased chars gets secondary callout actions and that the input callout isn't dismissed if there are no secondary actions.


## 3.5.0

This release deprecates some `system` properties in favor of the `standard` naming concept.

In most cases, the system behavior *is* the standard behavior.

### New features

* `SystemKeyboardButtonContent` is new view that extracts content logic from `SystemKeyboardButton`.
* `SystemKeyboardButtonRowItem` can now be created with generic views. 
* `SystemKeyboardSpaceButton` is new view that wraps `SystemKeyboardSpaceButtonContent` and applied a style and gestures to it.
* `SystemKeyboardSpaceButtonContent` is new view that animates between a locale text and a space text.

### Behavior changes

* `SystemKeyboard` now wraps the `buttonBuilder` generated views in a `SystemKeyboardButtonRowItem`.
* `SystemKeyboardButton` now applies a fallback text from the new appearance provider.
* The standard `SystemKeyboard` button builder generates `SystemKeyboardButtonContent` instead of `SystemKeyboardButton`.

### Deprecations

* `Color+systemKeyboardButtonBackgroundColorDark` has been renamed to `standardDarkButtonBackgroundColor` 
* `Color+systemKeyboardButtonBackgroundColorLight` has been renamed to `standardLightButtonBackgroundColor` 
* `Color+systemKeyboardButtonForegroundColor` has been renamed to `standardButtonForegroundColor` 
* `Color+systemKeyboardButtonShadowColor` has been renamed to `standardButtonShadowColor`
* `KeyboardAction+systemKeyboardButtonBackgroundColor` has been renamed to `standardButtonBackgroundColor` 
* `KeyboardAction+systemKeyboardButtonImage` has been renamed to `standardButtonImage` 
* `KeyboardAction+systemKeyboardButtonShadowColor` has been renamed to `standardButtonShadowColor`
* `KeyboardShiftState+systemImage` has been renamed to `standardButtonImage`
* `KeyboardShiftState+systemKeyboardButtonImage` was unused and has been deprecated.
* `KeyboardType+systemKeyboardButtonImage` has been renamed to `standardButtonImage`
* `View+systemKeyboardButtonStyle` has been renamed to `standardButtonStyle`
* `View+systemKeyboardButtonBackground` has been renamed to `standardButtonBackground`
* `View+systemKeyboardButtonFont` has been renamed to `standardButtonFont`
* `View+systemKeyboardButtonForeground` has been renamed to `standardButtonForeground`
* `View+systemKeyboardButtonShadow` has been renamed to `standardButtonShadow`

### Breaking changes

* `AutocompleteToolbar` now uses `AutocompleteSuggestion` instead of `String`. It makes it much more powerful, so I hope this breaking change is acceptable.
* `SystemKeyboardButtonRowItem` has been made generic.
* `SystemKeyboard.ButtonBuilder` now returns an `AnyView` since you may want to use any custom view for any button.


## 3.4.2

This release adds curves and behavior changes to the callout bubbles.

### New features

* `CalloutCurve` is a new shape that can be used to smoothen the two parts of a callout bubble.

### Behavior changes

* `CalloutStyle` now applies button frame insets when configured for a system keyboard.
* `InputCallout` has curves between the button area and the callout.
* `InputCalloutContext` has a new `isEnabled` property that is only true for phones, since it should not be displayed on iPads.
* `InputCalloutContext` no longer insets the button rect.
* `SecondaryInputCallout` has curves between the button area and the callout and the design is improved.
* `SystemInputCalloutContext` no longer insets the button rect.


## 3.4.1

This release fixes some visual artefacts in the callout bubbles.


## 3.4.0

This release adds support for input callouts and secondary input callouts.

### New features

This release has new features for callouts.

* `CalloutStyle` is a shared style for keyboard button callout.
* `InputCallout` is a callout that can highlight the currently pressed keyboard button.
* `InputCalloutContext` can be used to control `InputCallout` views.
* `InputCalloutStyle` can be used to style `InputCallout` views.
* `SecondaryInputCallout` is a callout that can present secondary actions for the currently pressed keyboard button.
* `SecondaryInputCalloutContext` can be used to control `SecondaryInputCallout` views.
* `SecondaryInputCalloutStyle` can be used to style `SecondaryInputCallout` views.
* `View+InputCallout` can be used to wrap any view in a `ZStack` with a topmost `InputCallout`
* `View+SecondaryInputCallout` can be used to wrap any view in a `ZStack` with a topmost `SecondaryInputCallout`

### Behavior changes

* `View+KeyboardGestures` has been extended with gestures for `InputCallout` and `SecondaryInputCallout`.

### Breaking changes

This release has breaking changes to experimental features.

* `ObservableKeyboardContext` `keyboardInputProvider` has been renamed to `keyboardInputSetProvider`



## 3.3.0

This release contains a lot of changes in the main library.

In this library, the observable context has received a `keyboardBehavior` property and the dismiss keyboard action has an icon. 


## 3.2.0

This release contains layout improvements and breaking changes.

* There is a new `SystemKeyboard` that takes a keyboard layout and renders it as button rows. 
* `SystemKeyboard` is more flexible than the previous keyboards, which have been removed.
* `SystemKeyboardDimensions` is a new struct that replaces the previous `SystemKeyboardStyle`.

The new input set and keyboard layout capabilities make it easier than ever to create keyboards.

### Breaking changes

The following views and extensions have been removed and replaced with `SystemKeyboard`:

* `AlphabeticSystemKeyboard`
* `NumericSystemKeyboard`
* `SymbolicSystemKeyboard`
* `SystemKeyboardBottomRow`
* `SystemKeyboardButtonRow`
* `SystemKeyboardStyle`
* `SystemKeyboardVStack`
* `View+systemKeyboardButtonCornerRadius`
* `View+systemKeyboardButtonFrame`

Even though much is removed, I hope that this makes it a lot easier to create systme keyboards in SwiftUI.


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
