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
 
 `TODO` This callout bubble currently breaks when wide chars
 are added to it. We should fix this in a later update.
 
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
    
    public var body: some View {
        VStack(alignment: context.alignment.horizontal, spacing: 0) {
            callout
            buttonArea
        }
        .font(style.font)
        .compositingGroup()
        .position(x: positionX, y: positionY)
        .shadow(color: style.callout.borderColor, radius: 0.4)
        .shadow(color: style.callout.shadowColor, radius: style.callout.shadowRadius)
        .opacity(context.isActive ? 1 : 0)
        .onTapGesture(perform: context.reset)
    }
}


// MARK: - Private Properties

private extension SecondaryInputCallout {
    
    var backgroundColor: Color { style.callout.backgroundColor }
    var buttonSize: CGSize { context.buttonFrame.size }
    var calloutInputs: [String] { context.actions.compactMap { $0.input } }
    var cornerRadius: CGFloat { style.callout.cornerRadius }
    var curveSize: CGFloat { style.callout.curveSize }
    
    var buttonArea: some View {
        HStack(alignment: .top, spacing: 0) {
            calloutCurve.rotationEffect(.degrees(90))
            Text("")
                .frame(buttonSize)
                .background(buttonAreaBackground)
            calloutCurve
        }
    }
    
    var buttonAreaBackground: some View {
        CustomRoundedRectangle(bottomLeft: cornerRadius, bottomRight: cornerRadius)
            .foregroundColor(backgroundColor)
    }
    
    var callout: some View {
        HStack(spacing: 0) {
            calloutEdge
            calloutBody
            calloutEdge.rotationEffect(.degrees(180))
        }
    }
    
    var calloutBody: some View {
        HStack(spacing: 0) {
            ForEach(Array(calloutInputs.enumerated()), id: \.offset) {
                Text($0.element)
                    .padding(style.selectedBackgroundPadding)
                    .background(isSelected($0.offset) ? style.selectedBackgroundColor : .clear)
                    .foregroundColor(isSelected($0.offset) ? style.selectedTextColor : style.textColor)
                    .cornerRadius(style.callout.cornerRadius)
                    .frame(buttonSize)
            }
        }.background(backgroundColor)
    }
    
    var calloutCurve: some View {
        CalloutCurve()
            .frame(width: curveSize, height: curveSize)
            .foregroundColor(backgroundColor)
    }
    
    var calloutEdge: some View {
        CustomRoundedRectangle(topLeft: cornerRadius, bottomLeft: cornerRadius)
            .frame(width: curveSize, height: buttonSize.height)
            .foregroundColor(backgroundColor)
    }
    
    var positionX: CGFloat {
        let buttonWidth = buttonSize.width
        let adjustment = (CGFloat(calloutInputs.count) * buttonWidth)/2
        let signedAdjustment = context.isTrailing ? -adjustment + buttonWidth : adjustment
        return context.buttonFrame.origin.x + signedAdjustment
    }
    
    var positionY: CGFloat {
        context.buttonFrame.origin.y
    }
}


// MARK: - Private Functions

private extension SecondaryInputCallout {
    
    func isSelected(_ offset: Int) -> Bool {
        context.selectedIndex == offset
    }
}


// MARK: - Private Extensions

private extension KeyboardAction {
    
    var input: String? {
        switch self {
        case .character(let char): return char
        default: return nil
        }
    }
}
