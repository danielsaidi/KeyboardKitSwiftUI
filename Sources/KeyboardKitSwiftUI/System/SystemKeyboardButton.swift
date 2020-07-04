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
 This view mimics the buttons used in an iOS system keyboard.
 It wraps a view and applies a button shape, drop shadow etc.
 as well as gesture actions for the provided `action`. Emoji
 actions use a clear background.
 
 You can provide the button with a custom text and image, if
 you don't want it to use the library standard text or image
 for the provided `action`.
 
 The view applies the `systemKeyboardButtonStyle` as well as
 the `keyboardAction` modifiers. You can use those modifiers
 on custom views, if you do not want to use this view.
 */
public struct SystemKeyboardButton: View {
    
    public init(
        action: KeyboardAction,
        text: String? = nil,
        image: Image? = nil,
        style: SystemKeyboardStyle) {
        self.action = action
        self.text = text
        self.image = image
        self.style = style
    }
    
    private let action: KeyboardAction
    private let text: String?
    private let image: Image?
    private let style: SystemKeyboardStyle
    
    @Environment(\.colorScheme) private var colorScheme: ColorScheme
    @EnvironmentObject private var context: ObservableKeyboardContext
    
    public var body: some View {
        buttonContent
            .systemKeyboardButtonStyle(for: action, scheme: colorScheme, context: context, style: style)
            .keyboardAction(action, context: context)
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
