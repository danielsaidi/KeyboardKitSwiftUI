//
//  ObservableKeyboardContext.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2020-06-15.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import KeyboardKit
import UIKit

/**
 This observable context provides observable properties to a
 keyboard extension that targets iOS 13 or later.
 
 Whenever a `KeyboardInputViewController` uses `setup(with:)`
 to use `SwiftUI`, KeyboardKit replaces the standard context
 with an instance of this type then injects it into the view
 environment, so it can be accessed with `@EnvironmentObject`.
 */
public class ObservableKeyboardContext: KeyboardContext, ObservableObject {
    
    public init(from context: KeyboardContext) {
        actionHandler = context.actionHandler
        controller = context.controller
        emojiCategory = context.emojiCategory
        hasDictationKey = context.hasDictationKey
        hasFullAccess = context.hasFullAccess
        inputSetProvider = context.inputSetProvider
        keyboardType = context.keyboardType
        needsInputModeSwitchKey = context.needsInputModeSwitchKey
        textDocumentProxy = context.textDocumentProxy
        textInputMode = context.textInputMode
        primaryLanguage = context.primaryLanguage
    }
    
    public var controller: KeyboardInputViewController
    
    @Published public var actionHandler: KeyboardActionHandler
    @Published public var emojiCategory: EmojiCategory
    @Published public var hasDictationKey: Bool
    @Published public var hasFullAccess: Bool
    @Published public var inputSetProvider: KeyboardInputSetProvider
    @Published public var keyboardType: KeyboardType
    @Published public var needsInputModeSwitchKey: Bool
    @Published public var primaryLanguage: String?
    @Published public var textDocumentProxy: UITextDocumentProxy
    @Published public var textInputMode: UITextInputMode?
}
