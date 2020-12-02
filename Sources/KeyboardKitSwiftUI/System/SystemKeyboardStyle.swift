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
 
 `TODO` This is not a viable way forward, since first of all
 this is layout, not style. Also, layout is a lot harder and
 cannot be specified with single values. Use this style with
 care, because it will gradually be replaced before KK 4.0.
 */
public class SystemKeyboardStyle: ObservableObject {
    
    public init(
        backspaceWidth: CGFloat,
        bottomRowSpacePercentage: CGFloat,
        buttonCornerRadius: CGFloat,
        buttonHeight: CGFloat,
        buttonSpacing: CGFloat,
        padding: EdgeInsets,
        rowSpacing: CGFloat,
        shiftWidth: CGFloat) {
        self.backspaceWidth = backspaceWidth
        self.bottomRowSpacePercentage = bottomRowSpacePercentage
        self.buttonCornerRadius = buttonCornerRadius
        self.buttonHeight = buttonHeight
        self.buttonSpacing = buttonSpacing
        self.padding = padding
        self.rowSpacing = rowSpacing
        self.shiftWidth = shiftWidth
    }
    
    public let backspaceWidth: CGFloat
    public let bottomRowSpacePercentage: CGFloat
    public let buttonHeight: CGFloat
    public let buttonSpacing: CGFloat
    public let buttonCornerRadius: CGFloat
    public let padding: EdgeInsets
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
            buttonCornerRadius: 4.0,
            buttonHeight: 42.0,
            buttonSpacing: 6.0,
            padding: EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4),
            rowSpacing: 12.0,
            shiftWidth: 50.0)
    }
}
