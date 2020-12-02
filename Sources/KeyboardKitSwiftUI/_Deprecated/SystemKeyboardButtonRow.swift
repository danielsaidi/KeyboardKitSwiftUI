//
//  SystemKeyboardButtonRow.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2020-07-04.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import KeyboardKit
import SwiftUI

@available(*, deprecated, message: "Use SystemKeyboard with a keyboard layout instead")
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

    /**
     This function will be used when a custom `buttonBuilder`
     is not provided. It will create a `SystemKeyboardButton`
     for the provided action.
     */
    static func standardButtonBuilder() -> ButtonBuilder {
        return { AnyView(SystemKeyboardButton(action: $0)) }
    }
}
