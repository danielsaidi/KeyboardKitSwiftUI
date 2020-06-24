//
//  View+KeyboardStyles.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2020-06-24.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import KeyboardKit
import SwiftUI

public extension View  {
    
    /**
     Apply the same button background that a standard system
     keyboard button would use for the provided color scheme
     and keyboard appearance.
     */
    func systemKeyboardButtonBackground(for scheme: ColorScheme, appearance: UIKeyboardAppearance) -> some View {
        self.background(systemKeyboardButtonBackgroundColor(
            for: scheme,
            appearance: appearance))
    }
    
    /**
     Get the button background that a system keyboard button
     would use for the provided color scheme and appearance.
     */
    func systemKeyboardButtonBackgroundColor(for scheme: ColorScheme, appearance: UIKeyboardAppearance) -> Color {
        if scheme == .dark { return Color(rgb: 107.0/255.0) }
        if appearance == .dark { return Color(rgb: 150.0/255.0) }
        return .white
    }
    
    /**
     Apply the same font that a system keyboard button would
     use for the provided keyboard action.
     */
    func systemKeyboardButtonFont(for action: KeyboardAction) -> some View {
        self.font(Font(action.systemFont))
    }
    
    /**
     Apply the same shadow that a system keyboard button has.
    */
    func systemKeyboardButtonShadow() -> some View {
        self.shadow(color: systemKeyboardButtonShadowColor, radius: 0, x: 0, y: 1)
    }
    
    /**
     Get the shadow color that a system keyboard button uses.
    */
    var systemKeyboardButtonShadowColor: Color {
        Color.black.opacity(0.3)
    }
}


private extension Color {
    
    /**
     Create a color where all RGB components use a 0-1 value.
     */
    init(rgb: Double) {
        self.init(red: rgb, green: rgb, blue: rgb)
    }
}
