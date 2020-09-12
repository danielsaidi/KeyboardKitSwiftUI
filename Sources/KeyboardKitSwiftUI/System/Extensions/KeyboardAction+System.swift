//
//  KeyboardAction+System.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2020-07-01.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import KeyboardKit
import SwiftUI

/**
 The `System` extensions help you create keyboard extensions
 that mimic native iOS system keyboards. Don't use them when
 you aim for a custom keyboard style.
 */
public extension KeyboardAction {
    
    /**
     The background color used by a system button, given the
     action, provided color scheme and keyboard appearance.
     */
    func systemKeyboardButtonBackgroundColor(for context: KeyboardContext) -> Color {
        if case .emoji = self { return .clearInteractable }
        if isSystemAction { return .systemKeyboardButtonBackgroundColorDark(for: context) }
        return .systemKeyboardButtonBackgroundColorLight(for: context)
    }
    
    /**
     The button image that should be used by a system button
     that performs this action.
     */
    func systemKeyboardButtonImage(for context: KeyboardContext) -> Image? {
        switch self {
        case .backspace: return .backspace
        case .command: return .command
        case .control: return .control
        case .dictation: return .dictation
        case .image(_, let imageName, _): return Image(imageName)
        case .keyboardType(let type): return type.systemKeyboardButtonImage(for: context)
        case .moveCursorBackward: return .moveCursorLeft
        case .moveCursorForward: return .moveCursorRight
        case .newLine: return .newLine
        case .nextKeyboard: return .globe
        case .option: return .option
        case .shift(let currentState): return currentState.systemImage
        case .systemImage(_, let imageName, _): return Image(systemName: imageName)
        case .tab: return .tab
        default: return nil
        }
    }
    
    /**
     The shadow color used by a system button for the action
     action, provided color scheme and keyboard appearance.
     */
    func systemKeyboardButtonShadowColor(for context: KeyboardContext) -> Color {
        if case .emoji = self { return .clear }
        return .systemKeyboardButtonShadowColor(for: context)
    }
}
