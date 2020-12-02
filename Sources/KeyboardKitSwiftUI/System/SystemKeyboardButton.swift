//
//  SystemKeyboardButton.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2020-07-02.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import KeyboardKit
import SwiftUI

/**
 This view mimics the buttons that are used in an iOS system
 keyboard. It wraps a view then applies a button shape, drop
 shadow etc. outside of it. It also applies gestures for the
 provided `action`.
 
 You can provide a custom text and image. If you don't, this
 view will use the standard system text and/or image for the
 provided `action`, using the `systemKeyboardButtonText` and
 `systemKeyboardButtonImage` action extensions.
 
 The view basically just applies `systemKeyboardButtonStyle`
 and `keyboardAction` modifiers to the button content. These
 modifiers can be applied to any view, to create a view that
 mimics a system button.
 */
public struct SystemKeyboardButton: View {
    
    public init(action: KeyboardAction) {
        self.action = action
        self.image = nil
        self.text = nil
    }
    
    public init(action: KeyboardAction, text: String) {
        self.action = action
        self.image = nil
        self.text = text
    }
    
    public init(action: KeyboardAction, image: Image) {
        self.action = action
        self.image = image
        self.text = nil
    }
    
    private let action: KeyboardAction
    private let image: Image?
    private let text: String?
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @EnvironmentObject var context: ObservableKeyboardContext
    @EnvironmentObject var style: SystemKeyboardStyle
    
    public var body: some View {
        buttonContent
            .systemKeyboardButtonStyle(for: action, context: context, style: style)
            .withGestures(for: action, context: context)
    }
}

private extension SystemKeyboardButton {
    
    var buttonText: String? {
        text ?? action.systemKeyboardButtonText
    }
    
    var buttonImage: Image? {
        image ?? action.systemKeyboardButtonImage(for: context)
    }
    
    var buttonContent: AnyView {
        if action == .nextKeyboard { return AnyView(NextKeyboardButton(controller: context.controller)) }
        if let text = buttonText { return AnyView(self.text(for: text)) }
        if let image = buttonImage { return AnyView(image) }
        return AnyView(Text(""))
    }
    
    func text(for text: String) -> some View {
        Text(text)
            .minimumScaleFactor(0.1)
            .lineLimit(1)
            .padding(2)
    }
}

private extension View {
    
    func withGestures(for action: KeyboardAction, context: KeyboardContext) -> AnyView {
        if action == .nextKeyboard { return AnyView(self) }
        return AnyView(self.keyboardAction(action, context: context))
    }
}
