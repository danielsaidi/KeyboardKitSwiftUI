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
 for alphabetic, numeric and symbolic keyboards.
 
 It has a space bar in its center, and will add any provided
 `leftmostActions` and `rightmostActions` next to it.
 
 You can provide a custom `buttonBuilder` to customize how a
 view is generated for an action. `standardButtonBuilder` is
 used if you don't provide a custom builder.
 */
public struct SystemKeyboardBottomRow: View {
    
    public init(
        leftmostActions: [KeyboardAction],
        rightmostActions: [KeyboardAction],
        buttonBuilder: @escaping ButtonBuilder = Self.standardButtonBuilder()) {
        self.actions = leftmostActions + [.space] + rightmostActions
        self.buttonBuilder = buttonBuilder
    }
    
    public typealias ButtonBuilder = (KeyboardAction) -> AnyView
    
    let actions: [KeyboardAction]
    private let buttonBuilder: ButtonBuilder

    @EnvironmentObject private var style: SystemKeyboardStyle
    @State private var viewSize: CGSize = .zero
    
    public var body: some View {
        HStack(spacing: style.buttonSpacing) {
            ForEach(Array(actionViews.enumerated()), id: \.offset) {
                $0.element
            }
        }.bindSize(to: $viewSize)
    }
}

public extension SystemKeyboardBottomRow {
    
    /**
     A `SystemKeyboardBottomRow` with just a space bar.
     */
    static var empty: SystemKeyboardBottomRow {
        SystemKeyboardBottomRow(leftmostActions: [], rightmostActions: [])
    }
    
    /**
     A standard `SystemKeyboardBottomRow` that has a certain
     `leftAction`, given a certain context.
     */
    static func standard(
        for context: KeyboardContext,
        leftmostAction: KeyboardAction) -> SystemKeyboardBottomRow {
        SystemKeyboardBottomRow(
            leftmostActions: standardLeftmostActions(for: context, leftAction: leftmostAction),
            rightmostActions: standardRightmostActions(for: context)
        )
    }
    
    /**
     The standard button builder that is used when no custom
     builder is provided.
     */
    static func standardButtonBuilder(
        emojiFallbackText: String = "☺") -> ButtonBuilder {
        return { action in
            let isEmojiKeyboardAction = action == .keyboardType(.emojis)
            let text = isEmojiKeyboardAction ? emojiFallbackText : action.systemKeyboardButtonText
            return AnyView(SystemKeyboardButton(action: action, text: text))
        }
    }
    
    /**
     The standard leftmost actions, given a certain context.
     
     `leftAction` will always be applied, while `rightAction`
     will replaced by `nextKeyboard` if the context requires
     an `inputModeSwitchKey`.
     */
    static func standardLeftmostActions(
        for context: KeyboardContext,
        leftAction: KeyboardAction,
        rightAction: KeyboardAction = .keyboardType(.emojis)) -> [KeyboardAction] {
        var result = [leftAction]
        result.append(context.needsInputModeSwitchKey ? .nextKeyboard : rightAction)
        return result
    }
    
    /**
     The standard rightmost actions, given a certain context.
     
     `rightAction` will always be applied, while `leftAction`
     will only applied if `needsInputModeSwitchKey` is `true`.
     */
    static func standardRightmostActions(
        for context: KeyboardContext,
        leftAction: KeyboardAction = .character("."),
        rightAction: KeyboardAction = .newLine) -> [KeyboardAction] {
        if context.needsInputModeSwitchKey { return [leftAction, rightAction] }
        return [rightAction]
    }
}

extension SystemKeyboardBottomRow {
    
    var actionViews: [AnyView] {
        actions.map {
            let view = buttonBuilder($0)
            guard $0 == .space else { return AnyView(view) }
            let width = style.bottomRowSpacePercentage
            return AnyView(view.frame(width: width * viewSize.width))
        }
    }
}
