//
//  View+Button.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2020-06-24.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import KeyboardKit
import SwiftUI

public extension View {
    
    /**
     Apply the standard button style, including a background,
     foreground color, corner radius, shadow and font.
     */
    func standardButtonStyle(
        for action: KeyboardAction,
        context: KeyboardContext,
        cornerRadius: CGFloat = 4.0) -> some View {
        self.standardButtonBackground(for: action, context: context)
            .standardButtonForeground(for: context)
            .cornerRadius(cornerRadius)
            .standardButtonShadow(for: context)
            .standardButtonFont(for: action, context: context)
    }
    
    /**
     Apply the standard button style, including a background,
     foreground color, corner radius, shadow and font.
     */
    func standardButtonBackground(for action: KeyboardAction, context: KeyboardContext) -> some View {
        background(action.systemKeyboardButtonBackgroundColor(for: context))
    }
    
    func standardButtonFont(for action: KeyboardAction, context: KeyboardContext) -> some View {
        let hasImage = action.systemKeyboardButtonImage(for: context) != nil
        let rawFont = Font(action.standardButtonFont)
        return hasImage ? font(rawFont.weight(.light)) : font(rawFont)
    }
    
    func standardButtonForeground(for context: KeyboardContext) -> some View {
        foregroundColor(.systemKeyboardButtonForegroundColor(for: context))
    }
    
    func standardButtonShadow(for context: KeyboardContext) -> some View {
        let color = Color.systemKeyboardButtonShadowColor(for: context)
        return self.shadow(color: color, radius: 0, x: 0, y: 1)
    }
}
