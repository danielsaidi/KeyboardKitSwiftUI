//
//  CalloutStyle.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2021-01-07.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import KeyboardKit
import SwiftUI

/**
 This struct can be used to style callout views, which are a
 type of view that is presented above a keyboard button.
 
 You can modify the `.standard` style instance to change the
 standard global style of all callout views.
 
 `IMPORTANT` This is an experimental feature that could have
 breaking changes in any minor release before 4.0.
 */
public struct CalloutStyle {
    
    public init(
        backgroundColor: Color = .white,
        borderColor: Color = Color.black.opacity(0.5),
        cornerRadius: CGFloat = 5,
        shadowColor: Color = Color.black.opacity(0.1),
        shadowRadius: CGFloat = 5,
        textColor: Color = .primary) {
        self.backgroundColor = backgroundColor
        self.borderColor = borderColor
        self.cornerRadius = cornerRadius
        self.shadowColor = shadowColor
        self.shadowRadius = shadowRadius
        self.textColor = textColor
    }
    
    public var backgroundColor: Color
    public var borderColor: Color
    public var cornerRadius: CGFloat
    public var shadowColor: Color
    public var shadowRadius: CGFloat
    public var textColor: Color
}

public extension CalloutStyle {
    
    static var standard = CalloutStyle()
    
    static func systemStyle(for context: KeyboardContext) -> CalloutStyle {
        let action = KeyboardAction.character("")
        var style = CalloutStyle.standard
        style.backgroundColor = action.systemKeyboardButtonBackgroundColor(for: context)
        return style
    }
}