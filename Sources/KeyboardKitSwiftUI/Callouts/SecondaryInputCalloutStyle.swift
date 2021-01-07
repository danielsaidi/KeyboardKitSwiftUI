//
//  SecondaryInputCalloutStyle.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2021-01-06.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

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
        backgroundColor: Color = .white,
        borderColor: Color = Color.black.opacity(0.3),
        cornerRadius: CGFloat = 5,
        font: Font = .body,
        selectedBackgroundColor: Color = Color.blue,
        selectedBackgroundPadding: CGFloat = 8,
        selectedTextColor: Color = Color.white,
        shadowColor: Color = Color.black.opacity(0.1),
        shadowRadius: CGFloat = 5,
        textColor: Color = .primary) {
        self.backgroundColor = backgroundColor
        self.borderColor = borderColor
        self.cornerRadius = cornerRadius
        self.font = font
        self.selectedBackgroundColor = selectedBackgroundColor
        self.selectedBackgroundPadding = selectedBackgroundPadding
        self.selectedTextColor = selectedTextColor
        self.shadowColor = shadowColor
        self.shadowRadius = shadowRadius
        self.textColor = textColor
    }
    
    public var backgroundColor: Color
    public var borderColor: Color
    public var cornerRadius: CGFloat
    public var font: Font
    public var selectedBackgroundColor: Color
    public var selectedBackgroundPadding: CGFloat
    public var selectedTextColor: Color
    public var shadowColor: Color
    public var shadowRadius: CGFloat
    public var textColor: Color
}

public extension SecondaryInputCalloutStyle {
    
    static var standard = SecondaryInputCalloutStyle()
}
