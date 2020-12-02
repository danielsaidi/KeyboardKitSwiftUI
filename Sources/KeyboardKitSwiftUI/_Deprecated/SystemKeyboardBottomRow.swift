//
//  SystemKeyboardBottomRow.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2020-07-02.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import KeyboardKit
import SwiftUI

@available(*, deprecated, message: "Use SystemKeyboard with a keyboard layout instead")
public struct SystemKeyboardBottomRow: View {
    
    public init(
        leftmostActions: [KeyboardAction],
        rightmostActions: [KeyboardAction],
        emojiButtonText: String = "☺",
        buttonBuilder: ButtonBuilder? = nil) {
        var actions = leftmostActions + [.space] + rightmostActions
        if emojiButtonText.count == 0 {
            actions = actions.filter { $0 != .keyboardType(.emojis) }
        }
        self.actions = actions
        self.buttonBuilder = buttonBuilder ?? Self.standardButtonBuilder(emojiButtonText: emojiButtonText)
        self.emojiButtonText = emojiButtonText
    }
    
    public typealias ButtonBuilder = (KeyboardAction) -> AnyView
    
    let actions: [KeyboardAction]
    private let buttonBuilder: ButtonBuilder
    private let emojiButtonText: String
    private var useEmojis: Bool { emojiButtonText.count > 0 }

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
        leftmostAction: KeyboardAction,
        emojiButtonText: String = "☺") -> SystemKeyboardBottomRow {
        SystemKeyboardBottomRow(
            leftmostActions: standardLeftmostActions(for: context, leftAction: leftmostAction),
            rightmostActions: standardRightmostActions(for: context),
            emojiButtonText: emojiButtonText
        )
    }
    
    /**
     This function will be used when a custom `buttonBuilder`
     is not provided. It will create a `SystemKeyboardButton`
     for the provided action.
     */
    static func standardButtonBuilder(emojiButtonText: String) -> ButtonBuilder {
        return { action in
            let isEmoji = action == .keyboardType(.emojis)
            if isEmoji { return AnyView(SystemKeyboardButton(action: action, text: emojiButtonText)) }
            return AnyView(SystemKeyboardButton(action: action))
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
