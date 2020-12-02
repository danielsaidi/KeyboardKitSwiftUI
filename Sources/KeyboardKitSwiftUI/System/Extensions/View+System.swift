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
 The `System` extensions help you create keyboard extensions
 that mimic native iOS system keyboards. Don't use them when
 you aim for a custom keyboard style.
 */
public extension View {
    
    /**
     Apply the style that a system keyboard button would use
     for a certain keyboard action, context and style.
     
     This makes the button horizontally greedy, which causes
     it to take up as much width as it can. You can limit it
     by applying a new explicit width after this modifier.
     */
    func systemKeyboardButtonStyle(
        for action: KeyboardAction,
        context: KeyboardContext,
        style: SystemKeyboardStyle) -> some View {
        self.systemKeyboardButtonBackground(for: action, context: context)
            .systemKeyboardButtonForeground(for: context)
            .systemKeyboardButtonCornerRadius(for: style)
            .systemKeyboardButtonShadow(for: context)
            .systemKeyboardButtonFont(for: action, context: context)
    }
}


// MARK: - Granular Extensions

public extension View {
    
    func systemKeyboardButtonBackground(
        for action: KeyboardAction,
        context: KeyboardContext) -> some View {
        background(action.systemKeyboardButtonBackgroundColor(for: context))
    }
    
    func systemKeyboardButtonCornerRadius(for style: SystemKeyboardStyle)  -> some View {
        cornerRadius(style.buttonCornerRadius)
    }
    
    func systemKeyboardButtonFont(for action: KeyboardAction, context: KeyboardContext) -> some View {
        let hasImage = action.systemKeyboardButtonImage(for: context) != nil
        let rawFont = Font(action.systemFont)
        return hasImage ? font(rawFont.weight(.light)) : font(rawFont)
    }
    
    func systemKeyboardButtonForeground(for context: KeyboardContext) -> some View {
        foregroundColor(.systemKeyboardButtonForegroundColor(for: context))
    }
    
    func systemKeyboardButtonShadow(for context: KeyboardContext) -> some View {
        let color = Color.systemKeyboardButtonShadowColor(for: context)
        return self.shadow(color: color, radius: 0, x: 0, y: 1)
    }
}
