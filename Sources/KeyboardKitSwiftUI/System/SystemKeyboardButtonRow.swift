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
 
 You can provide this view with a custom `buttonBuilder`. By
 default, it will use the `standardButtonBuilder`.
 
 This view can either be used to build an entire row or used
 as part of a keyboard row, e.g. to create button groups.
 */
public struct SystemKeyboardButtonRow: View {
    
    public init(
        actions: KeyboardActionRow,
        style: SystemKeyboardStyle,
        buttonBuilder: @escaping ButtonBuilder = Self.standardButtonBuilder()) {
        self.actions = actions
        self.style = style
        self.buttonBuilder = buttonBuilder
    }
    
    public typealias ButtonBuilder = (KeyboardAction) -> AnyView
    
    private let actions: KeyboardActionRow
    private let buttonBuilder: ButtonBuilder
    private let style: SystemKeyboardStyle

    @Environment(\.colorScheme) private var colorScheme: ColorScheme
    @EnvironmentObject private var context: ObservableKeyboardContext
    
    public var body: some View {
        HStack(spacing: style.buttonSpacing) {
            ForEach(Array(actions.enumerated()), id: \.offset) {
                self.buttonBuilder($0.element)
            }
        }
    }
}

public extension SystemKeyboardButtonRow {
    
    static func standardButtonBuilder(
        style: SystemKeyboardStyle = .standard) -> ButtonBuilder {
        return { AnyView(SystemKeyboardButton(action: $0, style: style)) }
    }
}
