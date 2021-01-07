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
 This callout can be used to show the currently typed action
 above the pressed keyboard button. It supports `.character`
 actions and will ignore any other actions.
 
 `TODO` The callout bubble shape does not look like a native
 callout bubble. It should be improved with a custom path.
 
 `IMPORTANT` This is an experimental feature that could have
 breaking changes in any minor release before 4.0.
 */
public struct InputCallout: View {
    
    public init(
        context: InputCalloutContext,
        style: InputCalloutStyle) {
        self.context = context
        self.style = style
    }
    
    @ObservedObject private var context: InputCalloutContext
    
    private let style: InputCalloutStyle
    
    static let coordinateSpace = InputCalloutContext.coordinateSpace
    
    public var body: some View {
        ZStack(alignment: .bottom) {
            buttonArea
            callout
        }
        .position(x: positionX, y: positionY)
        .compositingGroup()
        .shadow(color: style.borderColor, radius: 0.4)
        .shadow(color: style.shadowColor, radius: style.shadowRadius)
        .opacity(context.isActive ? 1 : 0)
        .onTapGesture(perform: context.reset)
    }
}

private extension InputCallout {
    
    var buttonArea: some View {
        Text("")
            .frame(context.buttonFrame.size)
            .background(buttonAreaBackground)
    }
    
    var buttonAreaBackground: some View {
        let radius = style.cornerRadius
        return CustomRoundedRectangle(bottomLeft: radius, bottomRight: radius)
            .foregroundColor(style.backgroundColor)
    }
    
    var callout: some View {
        Text(context.input ?? "")
            .font(style.font)
            .frame(width: style.calloutSize.width, height: style.calloutSize.height)
            .background(calloutBackground)
            .offset(y: -context.buttonFrame.size.height)
    }
    
    var calloutBackground: some View {
        RoundedRectangle(cornerRadius: style.cornerRadius)
            .foregroundColor(style.backgroundColor)
    }
    
    var positionX: CGFloat {
        context.buttonFrame.origin.x + context.buttonFrame.size.width/2
        
    }
    
    var positionY: CGFloat {
        context.buttonFrame.origin.y + context.buttonFrame.size.height - style.calloutSize.height/2
    }
}

private extension View {
    
    func frame(_ size: CGSize) -> some View {
        self.frame(width: size.width, height: size.height)
    }
}
