//
//  View+SecondaryInputCallout.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2021-01-06.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import SwiftUI

public extension View {
    
    /**
     This modifier can be applied to any keyboard views that
     should be able to present secondary input callouts. You
     can then use the same context to control whether or not
     the callout will appear or not.
     */
    func secondaryInputCallout(
        context: SecondaryInputCalloutContext = .shared,
        style: SecondaryInputCalloutStyle = .standard) -> some View {
        ZStack {
            self
            SecondaryInputCallout(context: context, style: style)
        }.coordinateSpace(name: SecondaryInputCallout.coordinateSpace)
    }
}
