//
//  SystemKeyboardStyle.swift
//  KeyboardKit  
//
//  Created by Daniel Saidi on 2020-07-04.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import CoreGraphics
import Combine
import SwiftUI

/**
 This struct provides static properties that are used by the
 various extensions in `View+System`.
 
 `TODO` The class has layout properties that should and will
 be removed in future versions, as soon as they are not used
 by the library. Be careful with using this until `4.0`.
 */
public class SystemKeyboardStyle: ObservableObject {
    
    public init(
        backspaceWidth: CGFloat,
        bottomRowSpacePercentage: CGFloat,
        buttonCornerRadius: CGFloat,
        buttonHeight: CGFloat = .standardKeyboardRowHeight(),
        buttonInsets: EdgeInsets = .insets(from: .standardKeyboardRowItemInsets()),
        shiftWidth: CGFloat) {
        self.backspaceWidth = backspaceWidth
        self.bottomRowSpacePercentage = bottomRowSpacePercentage
        self.buttonCornerRadius = buttonCornerRadius
        self.buttonHeight = buttonHeight
        self.buttonInsets = buttonInsets
        self.shiftWidth = shiftWidth
    }
    
    public let backspaceWidth: CGFloat
    public let bottomRowSpacePercentage: CGFloat
    public let buttonHeight: CGFloat
    public let buttonInsets: EdgeInsets
    public let buttonCornerRadius: CGFloat
    public let shiftWidth: CGFloat
}

public extension SystemKeyboardStyle {
    
    /**
     The standard style that is used if you do not provide a
     custom one.
     */
    static var standard: SystemKeyboardStyle {
        SystemKeyboardStyle(
            backspaceWidth: 50.0,
            bottomRowSpacePercentage: 0.5,
            buttonCornerRadius: 4.0,
            shiftWidth: 50.0)
    }
}
