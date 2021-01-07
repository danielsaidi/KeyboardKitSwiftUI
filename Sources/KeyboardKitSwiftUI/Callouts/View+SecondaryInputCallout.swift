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
     This modifier can be applied to any view that should be
     able to present a secondary input callout.
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
     presenting a secondary input callout when long pressed.
     */
    func secondaryInputCalloutGesture(
        action: KeyboardAction?,
        geo: GeometryProxy,
        inputContext: InputCalloutContext = .shared,
        secondaryContext: SecondaryInputCalloutContext = .shared) -> some Gesture {
        LongPressGesture()
            .onEnded { _ in
                inputContext.reset()
                secondaryContext.updateInputs(for: action, geo: geo) }
            .sequenced(before: DragGesture(minimumDistance: 0))
            .onChanged {
                switch $0 {
                case .first: break
                case .second(_, let drag): secondaryContext.updateSelection(with: drag)
                }
            }
            .onEnded { _ in secondaryContext.endDragGesture() }
    }
}
