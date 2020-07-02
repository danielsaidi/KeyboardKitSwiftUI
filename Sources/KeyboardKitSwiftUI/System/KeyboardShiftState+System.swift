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
 The "system" extensions are just suggestions if you want to
 mimic system keyboards. You do not have to use them in your
 custom keyboards.
 */
public extension KeyboardShiftState {
    
    /**
     The button image that should be used by a system button
     that applies this keyboard shift state.
     */
    var systemKeyboardButtonImage: Image {
        switch self {
        case .capsLocked: return .shiftCapslocked
        case .lowercased: return .shiftLowercased
        case .uppercased: return .shiftUppercased
        }
    }
}
