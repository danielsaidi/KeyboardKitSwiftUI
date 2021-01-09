//
//  Color+ButtonTests.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2020-07-01.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import KeyboardKit
import SwiftUI

/**
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
     The standard button tint color in a system keyboard.
     */
    static func standardButtonForegroundColor(for context: KeyboardContext) -> Color {
        if context.userInterfaceStyle == .light && context.keyboardAppearance == .dark { return .white }
        return .primary
    }
    
    /**
     The standard button shadow color in a system keyboard.
     */
    static func standardButtonShadowColor(for context: KeyboardContext) -> Color {
        Color.black.opacity(0.3)
    }
    
    /**
     The standard dark background color in a system keyboard.
     */
    static func standardDarkButtonBackgroundColor(for context: KeyboardContext) -> Color {
        if context.userInterfaceStyle == .dark { return standardDarkButtonBackgroundColorForDarkColorScheme }
        if context.keyboardAppearance == .dark { return standardDarkButtonBackgroundColorForLightColorSchemeAndDarkKeyboardAppearance }
        return standardDarkButtonBackgroundColorForLightColorSchemeAndLightKeyboardAppearance
    }
    
    /**
     The standard light background color in a system keyboard.
     */
    static func standardLightButtonBackgroundColor(for context: KeyboardContext) -> Color {
        if context.userInterfaceStyle == .dark { return standardLightButtonBackgroundColorForDarkColorScheme }
        if context.keyboardAppearance == .dark { return standardLightButtonBackgroundColorForLightColorSchemeAndDarkKeyboardAppearance }
        return standardLightButtonBackgroundColorForLightColorSchemeAndLightKeyboardAppearance
    }
}


// MARK: - Internal Extensions, used for testing

internal extension Color {
    
    init(rgb: Double) {
        self.init(red: rgb, green: rgb, blue: rgb)
    }
    
    static var standardDarkButtonBackgroundColorForDarkColorScheme: Color {
        Color(rgb: 71.0/255.0)
    }
    
    static var standardDarkButtonBackgroundColorForLightColorSchemeAndDarkKeyboardAppearance: Color {
        Color(rgb: 117.0/255.0)
    }
    
    static var standardDarkButtonBackgroundColorForLightColorSchemeAndLightKeyboardAppearance: Color {
        Color(red: 179.0/255.0, green: 184.0/255.0, blue: 193.0/255.0)
    }
    
    static var standardLightButtonBackgroundColorForDarkColorScheme: Color {
        Color(rgb: 107.0/255.0)
    }
    
    static var standardLightButtonBackgroundColorForLightColorSchemeAndDarkKeyboardAppearance: Color {
        Color(rgb: 150.0/255.0)
    }
    
    static var standardLightButtonBackgroundColorForLightColorSchemeAndLightKeyboardAppearance: Color {
        .white
    }
}

private extension KeyboardContext {
    
    var userInterfaceStyle: UIUserInterfaceStyle {
        traitCollection.userInterfaceStyle
    }
}
