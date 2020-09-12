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
 by native iOS keyboards. It can be used to create an entire
 row of buttons or be used within another row, e.g. to build
 a grouped row.
 
 You can provide a custom `buttonBuilder` to customize how a
 view is created for a certain action. If you don't, it will
 use the static `standardButtonBuilder` function.
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
