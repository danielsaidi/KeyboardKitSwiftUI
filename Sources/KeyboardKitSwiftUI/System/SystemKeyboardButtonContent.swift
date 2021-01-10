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
 This view resolves the correct content for a certain action.

 You can provide a custom text and image. If you don't, this
 view will use the standard system text and/or image for the
 provided `action` in the current context.
 */
public struct SystemKeyboardButtonContent: View {
    
    public init(
        action: KeyboardAction,
        text: String? = nil,
        image: Image? = nil) {
        self.action = action
        self.text = text
        self.image = image
    }
    
    private let action: KeyboardAction
    private let image: Image?
    private let text: String?
    
    private var appearance: KeyboardAppearanceProvider { context.keyboardAppearanceProvider }
    
    @EnvironmentObject var context: ObservableKeyboardContext
    
    @ViewBuilder
    public var body: some View {
        buttonContent
    }
}

private extension SystemKeyboardButtonContent {
    
    var buttonContent: AnyView {
        if action == .nextKeyboard { return AnyView(NextKeyboardButton(controller: context.controller)) }
        if let text = buttonText { return AnyView(textView(for: text)) }
        if let image = buttonImage { return AnyView(image) }
        return AnyView(Text(""))
    }
    
    var buttonText: String? {
        text ?? appearance.text(for: action)
    }
    
    var buttonImage: Image? {
        image ?? action.standardButtonImage(for: context)
    }
    
    func textView(for text: String) -> some View {
        Text(text)
            .minimumScaleFactor(0.1)
            .lineLimit(1)
            .padding(2)
    }
}
