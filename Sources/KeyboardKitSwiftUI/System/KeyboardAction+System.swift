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
 The "system" extensions are just suggestions if you want to
 mimic system keyboards. You do not have to use them in your
 custom keyboards.
 */
public extension KeyboardAction {
    
    /**
     The background color used by a system button, given the
     action, provided color scheme and keyboard appearance.
     */
    func systemKeyboardButtonBackgroundColor(
        forScheme scheme: ColorScheme,
        appearance: UIKeyboardAppearance) -> Color {
        if case .emoji = self {
            return .clearInteractable
        } else if isSystemAction {
            return .systemKeyboardButtonBackgroundColorDark(forScheme: scheme, appearance: appearance)
        } else {
            return .systemKeyboardButtonBackgroundColorLight(forScheme: scheme, appearance: appearance)
        }
    }
    
    /**
     The button image that should be used by a system button
     that performs this action.
     */
    var systemKeyboardButtonImage: Image? {
        switch self {
        case .backspace: return .backspace
        case .capsLock: return .shiftCapslocked
        case .command: return .command
        case .control: return .control
        case .dictation: return .dictation
        case .image(_, let imageName, _): return Image(imageName)
        case .keyboardType(let type): return type.systemKeyboardButtonImage
        case .moveCursorBackward: return .moveCursorLeft
        case .moveCursorForward: return .moveCursorRight
        case .newLine: return .newLine
        case .nextKeyboard: return .globe
        case .option: return .option
        case .shift: return .shiftLowercased
        case .shiftDown: return .shiftUppercased
        case .systemImage(_, let imageName, _): return Image(systemName: imageName)
        case .tab: return .tab
        default: return nil
        }
    }
    
    /**
     The shadow color used by a system button for the action
     action, provided color scheme and keyboard appearance.
     */
    func systemKeyboardButtonShadowColor(
        forScheme scheme: ColorScheme,
        appearance: UIKeyboardAppearance) -> Color {
        if case .emoji = self { return .clear }
        return .systemKeyboardButtonShadowColor(forScheme: scheme, appearance: appearance)
    }
}
