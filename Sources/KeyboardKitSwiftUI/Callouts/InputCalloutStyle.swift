//
//  SecondaryInputCalloutStyle.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2021-01-06.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import KeyboardKit
import SwiftUI

/**
 This struct can be used to style `InputCallout` views.
 
 You can modify the `.standard` style instance to change the
 standard global style of all `InputCallout` views.
 
 `IMPORTANT` This is an experimental feature that could have
 breaking changes in any minor release before 4.0.
 */
public struct InputCalloutStyle {
    
    public var backgroundColor: Color = .white
    public var borderColor: Color = Color.black.opacity(0.3)
    public var calloutSize: CGSize = CGSize(width: 60, height: 65)
    public var cornerRadius: CGFloat = 5
    public var font: Font = .title
    public var shadowColor: Color = Color.black.opacity(0.1)
    public var shadowRadius: CGFloat = 5
}

public extension InputCalloutStyle {
    
    static var standard = InputCalloutStyle()
    
    static func systemStyle(for context: KeyboardContext) -> InputCalloutStyle {
        let action = KeyboardAction.character("")
        var style = InputCalloutStyle.standard
        style.backgroundColor = action.systemKeyboardButtonBackgroundColor(for: context)
        return style
    }
}
