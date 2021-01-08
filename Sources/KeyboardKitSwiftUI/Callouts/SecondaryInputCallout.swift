//
//  SecondaryInputCallout.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2021-01-06.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import KeyboardKit
import SwiftUI

/**
 This callout can be used to present secondary input actions
 for akeyboard actions. It only supports `character` actions
 and will ignore any other actions.
 
 `TODO` The callout bubble shape does not look like a native
 callout bubble. It should be improved with a custom path.
 
 `IMPORTANT` This is an experimental feature that could have
 breaking changes in any minor release before 4.0.
 */
public struct SecondaryInputCallout: View {
    
    public init(
        context: SecondaryInputCalloutContext,
        style: SecondaryInputCalloutStyle) {
        self.context = context
        self.style = style
    }
    
    @ObservedObject private var context: SecondaryInputCalloutContext
    
    private let style: SecondaryInputCalloutStyle
    private var callout: CalloutStyle { style.callout }
    
    static let coordinateSpace = SecondaryInputCalloutContext.coordinateSpace
    
    public var body: some View {
        ZStack(alignment: context.alignment) {
            buttonArea
            calloutView
        }
        .font(style.font)
        .compositingGroup()
        .position(x: positionX, y: positionY)
        .shadow(color: callout.borderColor, radius: 0.4)
        .shadow(color: callout.shadowColor, radius: callout.shadowRadius)
        .opacity(context.isActive ? 1 : 0)
        .onTapGesture(perform: context.reset)
    }
}

private extension SecondaryInputCallout {
    
    var inputs: [String] {
        context.actions.compactMap { $0.input }
    }
    
    var buttonArea: some View {
        Text("")
            .frame(context.buttonFrame.size)
            .background(buttonAreaBackground)
    }
    
    var buttonAreaBackground: some View {
        let radius = callout.cornerRadius
        return CustomRoundedRectangle(bottomLeft: radius, bottomRight: radius)
            .foregroundColor(callout.backgroundColor)
    }
    
    var calloutView: some View {
        HStack(spacing: 0) {
            ForEach(Array(inputs.enumerated()), id: \.offset) {
                Text($0.element)
                    .padding(style.selectedBackgroundPadding)
                    .background(isSelected($0.offset) ? style.selectedBackgroundColor : .clear)
                    .cornerRadius(callout.cornerRadius)
                    .frame(context.buttonFrame.size)
                    .foregroundColor(isSelected($0.offset) ? style.selectedTextColor : style.textColor)
            }
        }
        .background(calloutViewBackground)
        .offset(y: -context.buttonFrame.height)
    }
    
    var calloutViewBackground: some View {
        let radius = callout.cornerRadius
        return CustomRoundedRectangle(
            topLeft: radius,
            topRight: radius,
            bottomLeft: context.isTrailing ? radius : 0,
            bottomRight: context.isTrailing ? 0 : radius)
            .foregroundColor(callout.backgroundColor)
    }
    
    var positionX: CGFloat {
        let buttonSize = context.buttonFrame.size.width
        let adjustment = (CGFloat(context.actions.count) * buttonSize)/2
        let signedAdjustment = context.isTrailing ? -adjustment + buttonSize : adjustment
        return context.buttonFrame.origin.x + signedAdjustment
    }
    
    var positionY: CGFloat {
        context.buttonFrame.origin.y + context.buttonFrame.size.height/2
    }
    
    func isSelected(_ offset: Int) -> Bool {
        context.selectedIndex == offset
    }
}

private extension KeyboardAction {
    
    var input: String? {
        switch self {
        case .character(let char): return char
        default: return nil
        }
    }
}
