//
//  SystemKeyboardButtonRow.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2020-07-04.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import KeyboardKit
import SwiftUI

/**
 This view mimicks a system keyboard button row that is used
 for alphabetic, numeric and symbolic system keyboards.
 
 This view can either be used to build an entire row or used
 as part of a keyboard row, e.g. to create button groups.
 
 You can provide this view with a custom `buttonBuilder`. By
 default, it will use the `standardButtonBuilder`.
 
 The view used the following injected `@EnvironmentObject`s:
 - `ObservableKeyboardContext`
 - `SystemKeyboardStyle`
 */
public struct SystemKeyboardButtonRow: View {
    
    public init(
        actions: KeyboardActionRow,
        buttonBuilder: @escaping ButtonBuilder = Self.standardButtonBuilder()) {
        self.actions = actions
        self.buttonBuilder = buttonBuilder
    }
    
    public typealias ButtonBuilder = (KeyboardAction) -> AnyView
    
    private let actions: KeyboardActionRow
    private let buttonBuilder: ButtonBuilder

    @Environment(\.colorScheme) private var colorScheme: ColorScheme
    @EnvironmentObject private var context: ObservableKeyboardContext
    @EnvironmentObject private var style: SystemKeyboardStyle
    
    public var body: some View {
        HStack(spacing: style.buttonSpacing) {
            ForEach(Array(actions.enumerated()), id: \.offset) {
                self.buttonBuilder($0.element)
            }
        }
    }
}

public extension SystemKeyboardButtonRow {
    
    static func standardButtonBuilder() -> ButtonBuilder {
        return { AnyView(SystemKeyboardButton(action: $0)) }
    }
}
