//
//  View+SecondaryInputCallout.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2021-01-06.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import KeyboardKit
import SwiftUI

public extension View {
    
    /**
     This modifier can be applied to any keyboard views that
     should be able to present secondary input callouts. You
     can then use the same context to control whether or not
     the callout will appear or not.
     */
    func secondaryInputCallout(
        for keyboardContext: KeyboardContext,
        context: SecondaryInputCalloutContext = .shared,
        style: SecondaryInputCalloutStyle = .standard) -> some View {
        return ZStack {
            self
            SecondaryInputCallout(context: context, style: style)
        }.coordinateSpace(name: SecondaryInputCallout.coordinateSpace)
    }
    
    /**
     This modifier can be applied to any view that should be
     triggering a secondary input callout.
     */
    func secondaryInputCalloutGesture(
        action: KeyboardAction?,
        geo: GeometryProxy,
        context: SecondaryInputCalloutContext) -> some Gesture {
        LongPressGesture()
            .onEnded { _ in  context.updateInputs(for: action, geo: geo) }
            .sequenced(before: DragGesture(minimumDistance: 0))
            .onChanged {
                switch $0 {
                case .first: break
                case .second(_, let drag): context.updateSelection(with: drag)
                }
            }
            .onEnded { _ in context.endDragGesture() }
    }
}
