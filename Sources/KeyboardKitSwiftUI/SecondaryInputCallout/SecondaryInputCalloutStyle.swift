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
        backgroundColor: Color = .white,
        borderColor: Color = Color.black.opacity(0.3),
        cornerRadius: CGFloat = 5,
        font: Font = .body,
        selectedBackgroundColor: Color = Color.yellow,
        selectedBackgroundPadding: CGFloat = 8,
        shadowColor: Color = Color.black.opacity(0.1),
        shadowRadius: CGFloat = 5) {
        self.backgroundColor = backgroundColor
        self.borderColor = borderColor
        self.cornerRadius = cornerRadius
        self.font = font
        self.selectedBackgroundColor = selectedBackgroundColor
        self.selectedBackgroundPadding = selectedBackgroundPadding
        self.shadowColor = shadowColor
        self.shadowRadius = shadowRadius
    }
    
    public let backgroundColor: Color
    public let borderColor: Color
    public let cornerRadius: CGFloat
    public let font: Font
    public let selectedBackgroundColor: Color
    public let selectedBackgroundPadding: CGFloat
    public let shadowColor: Color
    public let shadowRadius: CGFloat
}

public extension SecondaryInputCalloutStyle {
    
    /**
     This is the standard `SecondaryInputCallout` style.
     */
    static var standard: SecondaryInputCalloutStyle {
        SecondaryInputCalloutStyle()
    }
}
