//
//  SystemKeyboard.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2020-12-02.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import KeyboardKit
import SwiftUI

/**
 This view mimics native system keyboards, like the standard
 alphabetic, numeric and symbolic system keyboards.
 
 The keyboard view takes a `keyboardLayout` and converts the
 actions to buttons, using the provided `buttonBuilder`. The
 buttons are then wrapped in a `SystemKeyboardButtonRowItem`.
 */
public struct SystemKeyboard: View {
    
    public init(
        layout: KeyboardLayout,
        dimensions: KeyboardDimensions = StandardKeyboardDimensions(),
        buttonBuilder: @escaping ButtonBuilder = Self.standardButtonBuilder) {
        self.rows = layout.actionRows
        self.dimensions = dimensions
        self.buttonBuilder = buttonBuilder
    }
    
    private let buttonBuilder: ButtonBuilder
    private let dimensions: KeyboardDimensions
    private let rows: KeyboardActionRows
    
    @State private var keyboardSize: CGSize = .zero
    @State private var referenceSize: CGSize = .zero
    
    @EnvironmentObject var context: ObservableKeyboardContext
    
    public typealias ButtonBuilder = (KeyboardAction, KeyboardSize) -> AnyView
    public typealias KeyboardSize = CGSize
    
    public var body: some View {
        VStack(spacing: 0) {
            ForEach(rows.enumerated().map { $0 }, id: \.offset) {
                row(at: $0.offset, actions: $0.element)
            }
        }
        .bindSize(to: $keyboardSize)
        .inputCallout(style: .systemStyle(for: context))
        .secondaryInputCallout(for: context, style: .systemStyle(for: context))
    }
}

public extension SystemKeyboard {

    /**
     This is the standard `buttonBuilder`, that will be used
     when no custom builder is provided to the view.
     */
    static func standardButtonBuilder(action: KeyboardAction, keyboardSize: KeyboardSize) -> AnyView {
        AnyView(SystemKeyboardButtonContent(action: action))
    }
}

private extension SystemKeyboard {

    func row(at rowIndex: Int, actions: KeyboardActionRow) -> some View {
        HStack(spacing: 0) {
            ForEach(Array(actions.enumerated()), id: \.offset) { action in
                let width = dimensions.width(for: action.element, at: rowIndex, rowItemCount: actions.count, rowItemIndex: action.offset, context: context)
                buttonBuilder(action.element, keyboardSize)
                    .frame(maxWidth: .infinity)
                    .frame(height: dimensions.buttonHeight - dimensions.buttonInsets.top - dimensions.buttonInsets.bottom)
                    .standardButtonStyle(for: action.element, context: context)
                    .padding(dimensions.buttonInsets)
                    .frame(height: dimensions.buttonHeight)
                    .background(Color.clearInteractable)
                    .width(width, totalWidth: keyboardSize.width, referenceSize: $referenceSize)
                    .keyboardAction(action.element, actionHandler: context.actionHandler)
            }
        }
    }
}
