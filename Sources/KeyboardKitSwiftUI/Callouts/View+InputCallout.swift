//
//  View+InputCallout.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2021-01-06.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import KeyboardKit
import SwiftUI

public extension View {
    
    /**
     This modifier can be applied to any view that should be
     able to present an input callout.
     */
    func inputCallout(
        context: InputCalloutContext,
        style: InputCalloutStyle = .standard) -> some View{
        ZStack {
            self
            InputCallout(context: context, style: style)
        }.coordinateSpace(name: InputCallout.coordinateSpace)
    }
    
    /**
     This modifier can be applied to any view that should be
     presenting a secondary input callout when long pressed.
     */
    func inputCalloutGesture(
        action: KeyboardAction?,
        geo: GeometryProxy,
        context: InputCalloutContext) -> some Gesture {
        DragGesture(minimumDistance: 0, coordinateSpace: .local)
            .onChanged { _ in context.updateInput(for: action, geo: geo) }
            .onEnded { _ in context.reset() }
    }
}
