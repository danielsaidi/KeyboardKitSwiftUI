//
//  SystemKeyboardButtonRowItem.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2020-12-02.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import KeyboardKit
import SwiftUI

/**
 This view is meant to be used within a `SystemKeyboard` and
 is the default view if no custom view is provided.
 
 This view wraps a `SystemKeyboardButton`, without modifiers.
 It then adjusts the button to be used within a keyboard row.
 This involves applying height and paddings and new gestures
 in a way that make the buttons in a keyboard seem separated,
 but actually stick together with the padding being tappable.
 */
public struct SystemKeyboardButtonRowItem: View {
    
    public init(
        action: KeyboardAction,
        dimensions: SystemKeyboardDimensions,
        keyboardSize: CGSize) {
        self.action = action
        self.dimensions = dimensions
        self.keyboardSize = keyboardSize
    }
    
    private let action: KeyboardAction
    private let dimensions: SystemKeyboardDimensions
    private let keyboardSize: CGSize
    
    @EnvironmentObject var context: ObservableKeyboardContext
    
    public var body: some View {
        SystemKeyboardButton(action: action, useModifiers: false)
            .frame(maxWidth: .infinity)
            .frame(height: dimensions.buttonHeight - dimensions.buttonInsets.top - dimensions.buttonInsets.bottom)
            .applyWidth(for: action, from: dimensions, keyboardWidth: keyboardSize.width)
            .systemKeyboardButtonStyle(for: action, context: context)
            .padding(dimensions.buttonInsets)
            .frame(height: dimensions.buttonHeight)
            .background(Color.clearInteractable)
            .keyboardAction(action, context: context)
    }
}

private extension View {
    
    @ViewBuilder
    func applyWidth(
        for action: KeyboardAction,
        from dimensions: SystemKeyboardDimensions,
        keyboardWidth: CGFloat) -> some View {
        if let width = width(for: action, from: dimensions, keyboardWidth: keyboardWidth) {
            self.frame(width: width)
        } else {
            self
        }
    }
    
    func width(
        for action: KeyboardAction,
        from dimensions: SystemKeyboardDimensions,
        keyboardWidth: CGFloat) -> CGFloat? {
        switch action {
        case .shift, .backspace: return dimensions.shortButtonWidth
        case .space: return keyboardWidth * 0.5
        default: return nil
        }
    }
    
    func width(for keyboardType: KeyboardType, from dimensions: SystemKeyboardDimensions) -> CGFloat? {
        switch keyboardType {
        case .numeric, .alphabetic: return dimensions.longButtonWidth
        default: return dimensions.shortButtonWidth
        }
    }
}

private extension KeyboardAction {
    
    var isShift: Bool {
        switch self {
        case .shift: return true
        default: return false
        }
    }
}
