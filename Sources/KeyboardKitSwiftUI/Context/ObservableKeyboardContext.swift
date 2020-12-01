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
        controller = context.controller
        
        actionHandler = context.actionHandler
        emojiCategory = context.emojiCategory
        inputSetProvider = context.inputSetProvider
        keyboardType = context.keyboardType
        
        deviceOrientation = context.deviceOrientation
        hasDictationKey = context.hasDictationKey
        hasFullAccess = context.hasFullAccess
        needsInputModeSwitchKey = context.needsInputModeSwitchKey
        primaryLanguage = context.primaryLanguage
        textDocumentProxy = context.textDocumentProxy
        textInputMode = context.textInputMode
        traitCollection = context.traitCollection
    }
    
    unowned public var controller: KeyboardInputViewController
    
    @Published public var actionHandler: KeyboardActionHandler
    @Published public var emojiCategory: EmojiCategory
    @Published public var inputSetProvider: KeyboardInputSetProvider
    @Published public var keyboardType: KeyboardType
    
    @Published public var deviceOrientation: UIInterfaceOrientation
    @Published public var hasDictationKey: Bool
    @Published public var hasFullAccess: Bool
    @Published public var needsInputModeSwitchKey: Bool
    @Published public var primaryLanguage: String?
    @Published public var textDocumentProxy: UITextDocumentProxy
    @Published public var textInputMode: UITextInputMode?
    @Published public var traitCollection: UITraitCollection
}
