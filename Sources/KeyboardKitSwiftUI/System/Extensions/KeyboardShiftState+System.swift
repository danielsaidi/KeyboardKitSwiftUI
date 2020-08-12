//
//  KeyboardShiftState+System.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2020-07-01.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import KeyboardKit
import SwiftUI

/**
 The `System` extensions help you create keyboard extensions
 that mimic the native iOS keyboards. You shouldn't use them
 if you aim for a custom style.
 */
public extension KeyboardShiftState {
    
    /**
     The image that can be used to indicate that this is the
     current shift state.
     
     Note that this can't be used for buttons that switch to
     this state, since system shift state buttons should use
     the system image of the current shift state.
     */
    var systemImage: Image {
        switch self {
        case .capsLocked: return .shiftCapslocked
        case .lowercased: return .shiftLowercased
        case .uppercased: return .shiftUppercased
        }
    }
    
    /**
     The button image that should be used by a system button
     that applies this shift state, given a certain context.
     
     Since system keyboard shift state buttons are only used
     in alphabetic keyboards, this case will use the current
     shift state's icon instead of the target state. If this
     state is used in a non-alphabetic keyboard, the state's
     icon will be used instead.
     */
    func systemKeyboardButtonImage(for context: KeyboardContext) -> Image {
        switch context.keyboardType {
        case .alphabetic(let state): return state.systemImage
        default: return systemImage
        }
    }
}
