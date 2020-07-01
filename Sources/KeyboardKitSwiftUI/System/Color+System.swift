//
//  Color+System.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2020-07-01.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import KeyboardKit
import SwiftUI

public extension Color {
    
    /**
     The background color used by a dark system button for a
     certain color scheme and keyboard appearance.
     */
    static func systemKeyboardButtonBackgroundColorDark(
        forScheme scheme: ColorScheme,
        appearance: UIKeyboardAppearance) -> Color {
        if scheme == .dark { return systemKeyboardButtonBackgroundColorDarkForDarkColorScheme }
        if appearance == .dark { return systemKeyboardButtonBackgroundColorDarkForLightColorSchemeAndDarkKeyboardAppearance }
        return systemKeyboardButtonBackgroundColorDarkForLightColorSchemeAndLightKeyboardAppearance
    }
    
    /**
     The background color used by a light system button, for
     a certain color scheme and keyboard appearance.
     */
    static func systemKeyboardButtonBackgroundColorLight(
        forScheme scheme: ColorScheme,
        appearance: UIKeyboardAppearance) -> Color {
        if scheme == .dark { return systemKeyboardButtonBackgroundColorLightForDarkColorScheme }
        if appearance == .dark { return systemKeyboardButtonBackgroundColorLightForLightColorSchemeAndDarkKeyboardAppearance }
        return systemKeyboardButtonBackgroundColorLightForLightColorSchemeAndLightKeyboardAppearance
    }
    
    /**
     The foreground color used by a system button, given the
     provided color scheme and keyboard appearance.
     */
    static func systemKeyboardButtonForegroundColor(forScheme scheme: ColorScheme, appearance: UIKeyboardAppearance) -> Color {
        if scheme == .light && appearance == .dark { return .white }
        return .primary
    }
    
    /**
     The shadow color used by a system button.
     */
    static func systemKeyboardButtonShadowColor(forScheme scheme: ColorScheme, appearance: UIKeyboardAppearance) -> Color {
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
