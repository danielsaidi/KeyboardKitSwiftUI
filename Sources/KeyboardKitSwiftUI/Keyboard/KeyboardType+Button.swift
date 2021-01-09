//
//  KeyboardType+Button.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2020-07-02.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import KeyboardKit
import SwiftUI

public extension KeyboardType {
    
    /**
     The standard button image in a system keyboard.
     */
    var standardButtonImage: Image? {
        switch self {
        case .email: return .email
        case .emojis:
            if #available(iOS 14, *) {
                return .emoji
            } else { return nil }
        case .images: return .images
        default: return nil    
        }
    }
}
