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
    
    public static var backspaceWidth: CGFloat = 50.0
    public static var bottomRowSpacePercentage: CGFloat = 0.5
    public static var buttonSpacing: CGFloat = 6.0
    public static var cornerRadius: CGFloat = 4.0
    public static var frameHeight: CGFloat = 42.0
    public static var rowSpacing: CGFloat = 12.0
    public static var shiftWidth: CGFloat = 50.0
}
