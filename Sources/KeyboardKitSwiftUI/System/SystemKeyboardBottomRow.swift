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
 This view mimicks a system keyboard bottom row that is used
 for alphabetic, numeric and symbolic system keyboards.
 
 You can provide this view with a custom `leftmostAction` as
 well as a custom `buttonBuilder`. By default, it will use a
 `.none` action and the `standardButtonBuilder`.
 */
public struct SystemKeyboardBottomRow: View {
    
    public init(
        leftmostAction: KeyboardAction,
        buttonBuilder: @escaping ButtonBuilder = Self.standardButtonBuilder()) {
        self.leftmostAction = leftmostAction
        self.buttonBuilder = buttonBuilder
    }
    
    public typealias ButtonBuilder = (KeyboardAction) -> AnyView
    
    private let buttonBuilder: ButtonBuilder
    private let leftmostAction: KeyboardAction

    @Environment(\.colorScheme) private var colorScheme: ColorScheme
    @EnvironmentObject private var context: ObservableKeyboardContext
    @EnvironmentObject private var style: SystemKeyboardStyle
    @State private var viewSize: CGSize = .zero
    
    public var body: some View {
        HStack(spacing: style.buttonSpacing) {
            ForEach(Array(views(for: context).enumerated()), id: \.offset) {
                $0.element
            }
        }.bindSize(to: $viewSize)
    }
}

public extension SystemKeyboardBottomRow {
    
    static func standardButtonBuilder(
        emojiFallbackText: String = "☺") -> ButtonBuilder {
        return { action in
            let isEmojiKeyboardAction = action == .keyboardType(.emojis)
            let text = isEmojiKeyboardAction ? emojiFallbackText : action.systemKeyboardButtonText
            return AnyView(SystemKeyboardButton(action: action, text: text))
        }
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
            let width = style.bottomRowSpacePercentage
            return AnyView(view.frame(width: width * viewSize.width))
        }
    }
}
