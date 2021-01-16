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
     Apply a standard button background.
     */
    func standardButtonBackground(for action: KeyboardAction, context: KeyboardContext) -> some View {
        background(action.standardButtonBackgroundColor(for: context))
    }
    
    /**
     Apply a standard button font.
     
     `TODO` The appearance provider is currently in the main
     repo, which targets iOS 11. We can therefore not have a
     collection of SwiftUI-specific appearance properties in
     it, which means that the light font currently has to be
     added like below. I'm looking for a solution.
     */
    func standardButtonFont(for action: KeyboardAction, context: KeyboardContext) -> some View {
        let hasImage = action.standardButtonImage(for: context) != nil
        let rawFont = Font(context.keyboardAppearanceProvider.font(for: action))
        return hasImage ? font(rawFont.weight(.light)) : font(rawFont)
    }
    
    /**
     Apply a standard button foreground color.
     */
    func standardButtonForeground(for context: KeyboardContext) -> some View {
        foregroundColor(.standardButtonForegroundColor(for: context))
    }
    
    /**
     Apply a standard button shadow.
     */
    func standardButtonShadow(for context: KeyboardContext) -> some View {
        let color = Color.standardButtonShadowColor(for: context)
        return self.shadow(color: color, radius: 0, x: 0, y: 1)
    }
}
