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
     provided color scheme and keyboard appearance.
     
     This is just a suggestion and a best guess to mimic the
     system keyboard. It may be used by KeyboardKit, but you
     can ignore it if you don't need it.
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
}
