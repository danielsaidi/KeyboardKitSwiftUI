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
     for a certain keyboard action, context and style.
     */
    func systemKeyboardButtonStyle(
        for action: KeyboardAction,
        context: KeyboardContext,
        style: SystemKeyboardStyle) -> some View {
        self.systemKeyboardButtonForeground(for: context)
            .systemKeyboardButtonFrame(for: style)
            .systemKeyboardButtonBackground(for: action, context: context)
            .systemKeyboardButtonCornerRadius(for: style)
            .systemKeyboardButtonShadow(for: context)
            .systemKeyboardButtonFont(for: action)
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
    
    func systemKeyboardButtonFont(for action: KeyboardAction) -> some View {
        font(Font(action.systemFont))
    }
    
    func systemKeyboardButtonForeground(for context: KeyboardContext) -> some View {
        foregroundColor(.systemKeyboardButtonForegroundColor(for: context))
    }
    
    func systemKeyboardButtonFrame(for style: SystemKeyboardStyle)  -> some View {
        self.frame(height: style.buttonHeight)
            .frame(maxWidth: .infinity)
    }
    
    func systemKeyboardButtonShadow(for context: KeyboardContext) -> some View {
        let color = Color.systemKeyboardButtonShadowColor(for: context)
        return self.shadow(color: color, radius: 0, x: 0, y: 1)
    }
}
