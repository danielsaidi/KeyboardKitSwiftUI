//
//  SecondaryInputCalloutStyle.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2021-01-06.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This struct can be used to style a `SecondaryInputCallout`.
 */
public struct SecondaryInputCalloutStyle {
    
    public init(
        backgroundColor: Color = .primary,
        borderColor: Color = Color.black.opacity(0.3),
        cornerRadius: CGFloat = 5,
        font: Font = .body,
        selectedBackgroundColor: Color = Color.blue,
        selectedBackgroundPadding: CGFloat = 8,
        shadowColor: Color = Color.black.opacity(0.1),
        shadowRadius: CGFloat = 5,
        textColor: Color = .primary) {
        self.backgroundColor = backgroundColor
        self.borderColor = borderColor
        self.cornerRadius = cornerRadius
        self.font = font
        self.selectedBackgroundColor = selectedBackgroundColor
        self.selectedBackgroundPadding = selectedBackgroundPadding
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
    public var shadowColor: Color
    public var shadowRadius: CGFloat
    public var textColor: Color
}

public extension SecondaryInputCalloutStyle {
    
    /**
     This is the standard `SecondaryInputCallout` style.
     */
    static var standard: SecondaryInputCalloutStyle {
        SecondaryInputCalloutStyle()
    }
}
