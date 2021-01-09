//
//  SystemKeyboardDimensions.swift
//  KeyboardKit  
//
//  Created by Daniel Saidi on 2020-07-04.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import CoreGraphics
import Combine
import SwiftUI

/**
 This struct specifies dimensions for a `SystemKeyboard`.
 */
public struct SystemKeyboardDimensions {
    
    public init(
        buttonHeight: CGFloat = .standardKeyboardRowHeight(),
        buttonInsets: EdgeInsets = .insets(from: .standardKeyboardRowItemInsets()),
        longButtonWidth: CGFloat = 100.0,
        shortButtonWidth: CGFloat = 50.0) {
        self.buttonHeight = buttonHeight
        self.buttonInsets = buttonInsets
        self.longButtonWidth = longButtonWidth
        self.shortButtonWidth = shortButtonWidth
    }
    
    public let buttonHeight: CGFloat
    public let buttonInsets: EdgeInsets
    public let longButtonWidth: CGFloat
    public let shortButtonWidth: CGFloat
}
