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
        buttonBuilder: @escaping ButtonBuilder = Self.standardButtonBuilder) {
        self.buttonBuilder = buttonBuilder
        self.actions = actions
    }
    
    public typealias ButtonBuilder = (KeyboardAction) -> AnyView
    
    private let actions: KeyboardActionRow
    private let buttonBuilder: ButtonBuilder

    @Environment(\.colorScheme) private var colorScheme: ColorScheme
    @EnvironmentObject private var context: ObservableKeyboardContext
    
    public var body: some View {
        HStack(spacing: SystemKeyboardButtonStyle.buttonSpacing) {
            ForEach(Array(actions.enumerated()), id: \.offset) {
                self.buttonBuilder($0.element)
            }
        }
    }
}

public extension SystemKeyboardButtonRow {
    
    static var standardButtonBuilder: ButtonBuilder {
        return { AnyView(SystemKeyboardButton(action: $0)) }
    }
}
