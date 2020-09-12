//
//  KeyboardType+System.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2020-07-02.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import KeyboardKit
import SwiftUI

/**
 The `System` extensions help you create keyboard extensions
 that mimic native iOS system keyboards. Don't use them when
 you aim for a custom keyboard style.
 */
public extension KeyboardType {
    
    /**
     The button image that should be used by a system button
     that applies this keyboard type, if any.
     
     The context must be provided, since alphabetic switches
     use the current shift state to resolve the button image.
     */
    func systemKeyboardButtonImage(for context: KeyboardContext) -> Image? {
        switch self {
        case .email: return .email
        case .emojis:
            if #available(iOS 14, *) {
                return .emoji
            } else { return nil}
        case .images: return .images
        default: return nil    
        }
    }
}
