//
//  Action+System.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2020-07-01.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import KeyboardKit
import SwiftUI

public extension KeyboardAction {
    
    /**
     The background color used by a system button, given the
     action, provided color scheme and keyboard appearance.
     
     This is a suggestion and a best guess to mimic a system
     keyboard. KeyboardKit may use it, but you don't have to.
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
     The button image used by a system button for the action,
     if any.
     
     This is a suggestion and a best guess to mimic a system
     keyboard. KeyboardKit may use it, but you don't have to.
     */
    var systemKeyboardButtonImage: Image? {
        switch self {
        case .backspace: return .backspace
        case .capsLock: return .shiftCapslocked
        case .command: return .command
        case .control: return .control
        case .dictation: return .dictation
        case .image(_, let imageName, _): return Image(imageName)
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
     The button text used by a system button for this action,
     if any. You must manually specify any localized strings.
     
     This is a suggestion and a best guess to mimic a system
     keyboard. KeyboardKit may use it, but you don't have to.
     */
    var systemKeyboardButtonText: Text? {
        switch self {
        case .character(let char): return Text(char)
        case .emoji(let emoji): return Text(emoji)
        default: return nil
        }
    }
}
