//
//  View+SystemKeyboardStyles.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2020-06-24.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import KeyboardKit
import SwiftUI


// MARK: - Main Extension

public extension View {
    
    /**
     Apply the style that a system keyboard button would use
     for a certain keyboard action, color scheme and context,
     then apply the correct gestures for the provided action.
     */
    func systemKeyboardButton(
        _ action: KeyboardAction,
        scheme: ColorScheme,
        context: KeyboardContext) -> some View {
        let appearance = context.textDocumentProxy.keyboardAppearance ?? .default
        return self
            .systemKeyboardButtonStyle(for: action, scheme: scheme, appearance: appearance)
            .keyboardAction(action, context: context)
    }
    
    /**
     Apply the style that a system keyboard button would use
     for a certain keyboard action, color scheme and context.
     */
    func systemKeyboardButtonStyle(
        for action: KeyboardAction,
        scheme: ColorScheme,
        context: KeyboardContext) -> some View {
        let appearance = context.textDocumentProxy.keyboardAppearance ?? .default
        return self.systemKeyboardButtonStyle(for: action, scheme: scheme, appearance: appearance)
    }
    
    /**
     Apply the style that a system keyboard button would use
     for a certain action, color scheme and appearance.
     */
    func systemKeyboardButtonStyle(
        for action: KeyboardAction,
        scheme: ColorScheme,
        appearance: UIKeyboardAppearance) -> some View {
        self.systemKeyboardButtonForeground(for: scheme, appearance: appearance)
            .systemKeyboardButtonFrame()
            .systemKeyboardButtonBackground(for: scheme, appearance: appearance)
            .systemKeyboardButtonCornerRadius()
            .systemKeyboardButtonShadow(for: scheme, appearance: appearance)
            .systemKeyboardButtonFont(for: action)
    }
}


// MARK: - Granular Extensions

public extension View  {
    
    func systemKeyboardButtonBackground(for scheme: ColorScheme, appearance: UIKeyboardAppearance) -> some View {
        self.background(systemKeyboardButtonBackgroundColor(for: scheme, appearance: appearance))
    }
    
    func systemKeyboardButtonBackgroundColor(for scheme: ColorScheme, appearance: UIKeyboardAppearance) -> Color {
        if scheme == .dark { return Color(rgb: 107.0/255.0) }
        if appearance == .dark { return Color(rgb: 150.0/255.0) }
        return .white
    }
    
    func systemKeyboardButtonCornerRadius()  -> some View {
        self.cornerRadius(systemKeyboardButtonCornerRadiusValue)
    }
    
    var systemKeyboardButtonCornerRadiusValue: CGFloat { 4.0 }
    
    func systemKeyboardButtonFont(for action: KeyboardAction) -> some View {
        self.font(Font(action.systemFont))
    }
    
    func systemKeyboardButtonForeground(for scheme: ColorScheme, appearance: UIKeyboardAppearance) -> some View {
        let color = systemKeyboardButtonForegroundColor(for: scheme, appearance: appearance)
        return self.foregroundColor(color)
    }
    
    func systemKeyboardButtonForegroundColor(for scheme: ColorScheme, appearance: UIKeyboardAppearance) -> Color {
        if scheme == .light && appearance == .dark { return .white }
        return .primary
    }
    
    func systemKeyboardButtonFrame()  -> some View {
        self.frame(height: systemKeyboardButtonFrameHeightValue)
            .frame(maxWidth: .infinity)
    }
    
    var systemKeyboardButtonFrameHeightValue: CGFloat { 42.0 }
    
    func systemKeyboardButtonShadow(for scheme: ColorScheme, appearance: UIKeyboardAppearance) -> some View {
        let color = systemKeyboardButtonShadowColor(for: scheme, appearance: appearance)
        return self.shadow(color: color, radius: 0, x: 0, y: 1)
    }
    
    func systemKeyboardButtonShadowColor(for scheme: ColorScheme, appearance: UIKeyboardAppearance) -> Color {
        Color.black.opacity(0.3)
    }
    
    func systemKeyboardButtonTextShadow(for scheme: ColorScheme, appearance: UIKeyboardAppearance) -> some View {
        let color = systemKeyboardButtonTextShadowColor(for: scheme, appearance: appearance)
        return self.shadow(color: color, radius: 0.5, x: 0.5, y: 0.5)
    }
    
    func systemKeyboardButtonTextShadowColor(for scheme: ColorScheme, appearance: UIKeyboardAppearance) -> Color {
        Color.black.opacity(0.3)
    }
}


// MARK: - Private Color Extension

private extension Color {
    
    /**
     Create a color where all RGB components use a 0-1 value.
     */
    init(rgb: Double) {
        self.init(red: rgb, green: rgb, blue: rgb)
    }
}
