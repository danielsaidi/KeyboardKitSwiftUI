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
 This struct can be used to style `SecondaryInputCallout`s.
 
 You can modify the `.standard` style instance to change the
 standard global style of all `SecondaryInputCallout` views.
 
 `IMPORTANT` This is an experimental feature that could have
 breaking changes in any minor release before 4.0.
 */
public struct SecondaryInputCalloutStyle {
    
    public init(
        callout: CalloutStyle = .standard,
        font: Font = .body,
        selectedBackgroundColor: Color = Color.blue,
        selectedBackgroundPadding: CGFloat = 8,
        selectedTextColor: Color = Color.white,
        textColor: Color = .primary) {
        self.callout = callout
        self.font = font
        self.selectedBackgroundColor = selectedBackgroundColor
        self.selectedBackgroundPadding = selectedBackgroundPadding
        self.selectedTextColor = selectedTextColor
        self.textColor = textColor
    }
    
    public var callout: CalloutStyle
    public var font: Font
    public var selectedBackgroundColor: Color
    public var selectedBackgroundPadding: CGFloat
    public var selectedTextColor: Color
    public var textColor: Color
}

public extension SecondaryInputCalloutStyle {
    
    static var standard = SecondaryInputCalloutStyle()
    
    static func systemStyle(for context: KeyboardContext) -> SecondaryInputCalloutStyle {
        var style = SecondaryInputCalloutStyle.standard
        style.callout = .systemStyle(for: context)
        return style
    }
}
