//
//  Color+System.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2020-07-01.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import KeyboardKit
import SwiftUI

/**
 These colors can be used to mimic the system keyboards. You
 don't have to use them in your custom keyboards.
 
 The `System` extensions help you create keyboard extensions
 that mimic the native iOS keyboards. You shouldn't use them
 if you aim for a custom style.
 
 `IMPORTANT` The `KeyboardContext`s `userInterfaceStyle` has
 an incorrect state when `keyboardAppearance` is `.dark` and
 the device runs in `.light` mode. The keyboard will then be
 told that `userInterfaceStyle` is `dark` instead of `light`.
 This is WRONG, since dark keyboard appearance in light mode
 shouldn't look the same as any appearance in dark mode. You
 can see this bug in the SwiftUI demo app and start edit the
 text field that requires dark appearance. The keyboard will
 then apply dark mode colors, while the extension background
 (which is managed by the system) uses the dark appearance's
 background color.
 
 Bug info (also reported to Apple in Feedback Assistant):
 https://github.com/danielsaidi/KeyboardKit/issues/107
 */
public extension Color {
    
    /**
     The background color used by a dark system button for a
     certain color scheme and keyboard appearance.
     */
    static func systemKeyboardButtonBackgroundColorDark(for context: KeyboardContext) -> Color {
        if context.userInterfaceStyle == .dark { return systemKeyboardButtonBackgroundColorDarkForDarkColorScheme }
        if context.keyboardAppearance == .dark { return systemKeyboardButtonBackgroundColorDarkForLightColorSchemeAndDarkKeyboardAppearance }
        return systemKeyboardButtonBackgroundColorDarkForLightColorSchemeAndLightKeyboardAppearance
    }
    
    /**
     The background color used by a light system button, for
     a certain color scheme and keyboard appearance.
     */
    static func systemKeyboardButtonBackgroundColorLight(for context: KeyboardContext) -> Color {
        if context.userInterfaceStyle == .dark { return systemKeyboardButtonBackgroundColorLightForDarkColorScheme }
        if context.keyboardAppearance == .dark { return systemKeyboardButtonBackgroundColorLightForLightColorSchemeAndDarkKeyboardAppearance }
        return systemKeyboardButtonBackgroundColorLightForLightColorSchemeAndLightKeyboardAppearance
    }
    
    /**
     The foreground color used by a system button, given the
     provided color scheme and keyboard appearance.
     */
    static func systemKeyboardButtonForegroundColor(for context: KeyboardContext) -> Color {
        if context.userInterfaceStyle == .light && context.keyboardAppearance == .dark { return .white }
        return .primary
    }
    
    /**
     The shadow color used by a system button.
     */
    static func systemKeyboardButtonShadowColor(for context: KeyboardContext) -> Color {
        Color.black.opacity(0.3)
    }
}


// MARK: - Internal Extensions, used for testing

internal extension Color {
    
    init(rgb: Double) {
        self.init(red: rgb, green: rgb, blue: rgb)
    }
    
    static var systemKeyboardButtonBackgroundColorDarkForDarkColorScheme: Color {
        Color(rgb: 71.0/255.0)
    }
    
    static var systemKeyboardButtonBackgroundColorDarkForLightColorSchemeAndDarkKeyboardAppearance: Color {
        Color(rgb: 117.0/255.0)
    }
    
    static var systemKeyboardButtonBackgroundColorDarkForLightColorSchemeAndLightKeyboardAppearance: Color {
        Color(red: 179.0/255.0, green: 184.0/255.0, blue: 193.0/255.0)
    }
    
    static var systemKeyboardButtonBackgroundColorLightForDarkColorScheme: Color {
        Color(rgb: 107.0/255.0)
    }
    
    static var systemKeyboardButtonBackgroundColorLightForLightColorSchemeAndDarkKeyboardAppearance: Color {
        Color(rgb: 150.0/255.0)
    }
    
    static var systemKeyboardButtonBackgroundColorLightForLightColorSchemeAndLightKeyboardAppearance: Color {
        .white
    }
}
