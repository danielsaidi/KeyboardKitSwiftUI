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
 This struct specifies dimensions for a `SystemKeyboard`. It
 currently uses temporary width values that must be resolved
 in the same dynamic way as height and insets.
 */
public struct SystemKeyboardDimensions {
    
    public init(
        backspaceWidth: CGFloat = 50.0,
        bottomRowSpacePercentage: CGFloat = 0.5,
        buttonHeight: CGFloat = .standardKeyboardRowHeight(),
        buttonInsets: EdgeInsets = .insets(from: .standardKeyboardRowItemInsets()),
        shiftWidth: CGFloat = 50.0) {
        self.backspaceWidth = backspaceWidth
        self.bottomRowSpacePercentage = bottomRowSpacePercentage
        self.buttonHeight = buttonHeight
        self.buttonInsets = buttonInsets
        self.shiftWidth = shiftWidth
    }
    
    public let backspaceWidth: CGFloat
    public let bottomRowSpacePercentage: CGFloat
    public let buttonHeight: CGFloat
    public let buttonInsets: EdgeInsets
    public let shiftWidth: CGFloat
}
