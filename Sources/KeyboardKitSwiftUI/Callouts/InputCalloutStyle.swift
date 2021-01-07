//
//  SecondaryInputCalloutStyle.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2021-01-06.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI

/**
 This struct can be used to style `InputCallout` views.
 
 You can modify the `.standard` style instance to change the
 standard global style of all `InputCallout` views.
 
 `IMPORTANT` This is an experimental feature that could have
 breaking changes in any minor release before 4.0.
 */
public struct InputCalloutStyle {
    
    public let backgroundColor: Color = .white
    public let borderColor: Color = Color.black.opacity(0.3)
    public let calloutSize: CGSize = CGSize(width: 60, height:70)
    public let cornerRadius: CGFloat = 5
    public let font: Font = .title
    public let shadowColor: Color = Color.black.opacity(0.1)
    public let shadowRadius: CGFloat = 5
}

public extension InputCalloutStyle {
    
    static var standard = InputCalloutStyle()
}
