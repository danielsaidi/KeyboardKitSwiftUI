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
 by native iOS keyboards. It has a center space bar and adds
 the `leftmostActions` and `rightmostActions` next to it.
 
 You can provide a custom `buttonBuilder` to customize how a
 view is created for a certain action. If you don't, it will
 use the static `standardButtonBuilder` function.
 
 Since emoji support is not yet implemented for SwiftUI, you
 can provide an empty `emojiButtonText` to hide the button.
 */
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
            let text = isEmoji ? emojiButtonText : action.systemKeyboardButtonText
            return AnyView(SystemKeyboardButton(action: action, text: text ?? ""))
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
