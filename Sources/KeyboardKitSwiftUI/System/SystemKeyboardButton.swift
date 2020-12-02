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
 modifiers can be applied to any other view as well. You can
 disable the modifiers by setting `withModifiers` to `false`,
 which will make it only generate the correct `buttonContent`.
 */
public struct SystemKeyboardButton: View {
    
    public init(
        action: KeyboardAction,
        text: String? = nil,
        image: Image? = nil,
        useModifiers: Bool = true) {
        self.action = action
        self.image = image
        self.text = text
        self.useModifiers = useModifiers
    }
    
    private let action: KeyboardAction
    private let image: Image?
    private let text: String?
    private let useModifiers: Bool
    
    @EnvironmentObject var context: ObservableKeyboardContext
    
    @ViewBuilder
    public var body: some View {
        if !useModifiers {
            buttonContent
        } else {
            buttonContent
            .systemKeyboardButtonStyle(for: action, context: context)
            .keyboardAction(action, context: context)
        }
    }
}

private extension SystemKeyboardButton {
    
    var buttonContent: AnyView {
        if action == .nextKeyboard { return AnyView(NextKeyboardButton(controller: context.controller)) }
        if let text = buttonText { return AnyView(self.text(for: text)) }
        if let image = buttonImage { return AnyView(image) }
        return AnyView(Text(""))
    }
    
    var buttonText: String? {
        text ?? action.systemKeyboardButtonText
    }
    
    var buttonImage: Image? {
        image ?? action.systemKeyboardButtonImage(for: context)
    }
    
    func text(for text: String) -> some View {
        Text(text)
            .minimumScaleFactor(0.1)
            .lineLimit(1)
            .padding(2)
    }
}
