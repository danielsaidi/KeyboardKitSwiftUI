//
//  View+System.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2020-06-24.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import KeyboardKit
import SwiftUI

/**
 The "system" extensions are just suggestions if you want to
 mimic system keyboards. You do not have to use them in your
 custom keyboards.
 */
public extension View {
    
    /**
     Apply the style that a system keyboard button would use
     for a certain keyboard action, color scheme and context.
     */
    func systemKeyboardButtonStyle(
        for action: KeyboardAction,
        scheme: ColorScheme,
        context: KeyboardContext,
        style: SystemKeyboardStyle) -> some View {
        self.systemKeyboardButtonStyle(
            for: action,
            scheme: scheme,
            appearance: context.textDocumentProxy.keyboardAppearance ?? .default,
            style: style)
    }
    
    /**
     Apply the style that a system keyboard button would use
     for a certain action, color scheme and appearance.
     */
    func systemKeyboardButtonStyle(
        for action: KeyboardAction,
        scheme: ColorScheme,
        appearance: UIKeyboardAppearance,
        style: SystemKeyboardStyle) -> some View {
        self.systemKeyboardButtonForeground(forScheme: scheme, appearance: appearance)
            .systemKeyboardButtonFrame(style: style)
            .systemKeyboardButtonBackground(for: action, scheme: scheme, appearance: appearance)
            .systemKeyboardButtonCornerRadius(style: style)
            .systemKeyboardButtonShadow(forScheme: scheme, appearance: appearance)
            .systemKeyboardButtonFont(for: action)
    }
}


// MARK: - Granular Extensions

public extension View {
    
    func systemKeyboardButtonBackground(
        for action: KeyboardAction,
        scheme: ColorScheme,
        appearance: UIKeyboardAppearance) -> some View {
        let color = action.systemKeyboardButtonBackgroundColor(forScheme: scheme, appearance: appearance)
        return self.background(color)
    }
    
    func systemKeyboardButtonCornerRadius(style: SystemKeyboardStyle)  -> some View {
        cornerRadius(style.cornerRadius)
    }
    
    func systemKeyboardButtonFont(for action: KeyboardAction) -> some View {
        font(Font(action.systemFont))
    }
    
    func systemKeyboardButtonForeground(forScheme scheme: ColorScheme, appearance: UIKeyboardAppearance) -> some View {
        foregroundColor(.systemKeyboardButtonForegroundColor(forScheme: scheme, appearance: appearance))
    }
    
    func systemKeyboardButtonFrame(style: SystemKeyboardStyle)  -> some View {
        self.frame(height: style.frameHeight)
            .frame(maxWidth: .infinity)
    }
    
    func systemKeyboardButtonShadow(forScheme scheme: ColorScheme, appearance: UIKeyboardAppearance) -> some View {
        let color = Color.systemKeyboardButtonShadowColor(forScheme: scheme, appearance: appearance)
        return self.shadow(color: color, radius: 0, x: 0, y: 1)
    }
}
