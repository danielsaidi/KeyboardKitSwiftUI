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
 This view mimicks the system keyboard buttons that are used
 in all system keyboards. It wraps any view and surrounds it
 with a button shape, a drop shadow etc. Emoji actions use a
 clear background.
 
 You can provide the button with a custom text and image, if
 you don't want it to use the library standard text or image
 for the provided `action`.
 
 The view applies the `systemKeyboardButtonStyle` as well as
 the `keyboardAction` modifiers, using the injected context.
 You can use those modifiers yourself, if you do not want to
 use this view.
 */
public struct SystemKeyboardButton: View {
    
    public init(action: KeyboardAction, text: String? = nil, image: Image? = nil) {
        self.action = action
        self.text = text
        self.image = image
    }
    
    private let action: KeyboardAction
    private let text: String?
    private let image: Image?
    
    @Environment(\.colorScheme) private var colorScheme: ColorScheme
    @EnvironmentObject private var context: ObservableKeyboardContext
    
    public var body: some View {
        buttonContent
            .systemKeyboardButtonStyle(for: action, scheme: colorScheme, context: context)
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
        if let text = buttonText { return AnyView(Text(text)) }
        if let image = buttonImage { return AnyView(image) }
        return AnyView(Text("-"))
    }
}
