//
//  SystemKeyboardStyle.swift
//  KeyboardKit  
//
//  Created by Daniel Saidi on 2020-07-04.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import CoreGraphics

/**
 This struct provides static properties that are used by the
 various extensions in `View+System`.
 
 `TODO` This is not a long-term solution. Instead, the views
 should be injected with a style. I'll look into this later.
 */
public struct SystemKeyboardStyle {
    
    public init(
        backspaceWidth: CGFloat,
        bottomRowSpacePercentage: CGFloat,
        buttonSpacing: CGFloat,
        cornerRadius: CGFloat,
        frameHeight: CGFloat,
        rowSpacing: CGFloat,
        shiftWidth: CGFloat) {
        self.backspaceWidth = backspaceWidth
        self.bottomRowSpacePercentage = bottomRowSpacePercentage
        self.buttonSpacing = buttonSpacing
        self.cornerRadius = cornerRadius
        self.frameHeight = frameHeight
        self.rowSpacing = rowSpacing
        self.shiftWidth = shiftWidth
    }
    
    public let backspaceWidth: CGFloat
    public let bottomRowSpacePercentage: CGFloat
    public let buttonSpacing: CGFloat
    public let cornerRadius: CGFloat
    public let frameHeight: CGFloat
    public let rowSpacing: CGFloat
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
            buttonSpacing: 6.0,
            cornerRadius: 4.0,
            frameHeight: 42.0,
            rowSpacing: 12.0,
            shiftWidth: 50.0)
    }
}
