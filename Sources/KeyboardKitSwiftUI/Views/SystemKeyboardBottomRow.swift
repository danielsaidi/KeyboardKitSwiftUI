//
//  SystemKeyboardBottomRow.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2020-07-02.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import KeyboardKit
import SwiftUI

/**
 This view represents the system keyboard bottom row that is
 used for alphabetic, numeric and symbolic system keyboards.
 
 When you create an instance of this view, you can specify a
 custom `leftmostAction`, as well as a custom `buttonBuilder`
 that will create a view for each action in the row.
 
 The space bar will take up 50% of the available width. This
 can currenty not be modified.
 */
public struct SystemKeyboardBottomRow: View {
    
    public init(
        leftmostAction: KeyboardAction,
        buttonBuilder: @escaping ButtonBuilder) {
        self.leftmostAction = leftmostAction
        self.buttonBuilder = buttonBuilder
    }
    
    public typealias ButtonBuilder = (KeyboardAction) -> AnyView
    
    private let buttonBuilder: ButtonBuilder
    private let leftmostAction: KeyboardAction

    @Environment(\.colorScheme) private var colorScheme: ColorScheme
    @EnvironmentObject private var context: ObservableKeyboardContext
    @State private var size: CGSize = .zero
    
    public var body: some View {
        HStack {
            ForEach(Array(views(for: context).enumerated()), id: \.offset) {
                $0.element
            }
        }.bindSize(to: $size)
    }
}

extension SystemKeyboardBottomRow {
    
    func actions(for context: KeyboardContext) -> [KeyboardAction] {
        let hasNextKeyboard = context.needsInputModeSwitchKey
        var result = [leftmostAction]
        result.append(hasNextKeyboard ? .nextKeyboard : .keyboardType(.emojis))
        result.append(.space)
        result.append(hasNextKeyboard ? .keyboardType(.emojis) : .keyboardType(.images))
        result.append(.newLine)
        return result
    }
    
    func views(for context: KeyboardContext) -> [AnyView] {
        actions(for: context).map {
            let view = buttonBuilder($0)
            guard $0 == .space else { return AnyView(view) }
            return AnyView(view.frame(width: 0.5 * size.width))
        }
    }
}
