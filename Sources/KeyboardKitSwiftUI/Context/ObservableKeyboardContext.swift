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
        
        device = context.device
        
        actionHandler = context.actionHandler
        emojiCategory = context.emojiCategory
        keyboardBehavior = context.keyboardBehavior
        keyboardInputSetProvider = context.keyboardInputSetProvider
        keyboardLayoutProvider = context.keyboardLayoutProvider
        keyboardType = context.keyboardType
        secondaryCalloutActionProvider = context.secondaryCalloutActionProvider
        
        deviceOrientation = context.deviceOrientation
        hasDictationKey = context.hasDictationKey
        hasFullAccess = context.hasFullAccess
        locale = context.locale
        needsInputModeSwitchKey = context.needsInputModeSwitchKey
        primaryLanguage = context.primaryLanguage
        textDocumentProxy = context.textDocumentProxy
        textInputMode = context.textInputMode
        traitCollection = context.traitCollection
        
        SecondaryInputCalloutContext.shared = SecondaryInputCalloutContext(
            actionProvider: context.secondaryCalloutActionProvider,
            context: self)
    }
    
    unowned public var controller: KeyboardInputViewController
    
    public let device: UIDevice
    
    @Published public var actionHandler: KeyboardActionHandler
    @Published public var emojiCategory: EmojiCategory
    @Published public var keyboardBehavior: KeyboardBehavior
    @Published public var keyboardInputSetProvider: KeyboardInputSetProvider
    @Published public var keyboardLayoutProvider: KeyboardLayoutProvider
    @Published public var keyboardType: KeyboardType
    @Published public var secondaryCalloutActionProvider: SecondaryCalloutActionProvider
    
    @Published public var deviceOrientation: UIInterfaceOrientation
    @Published public var hasDictationKey: Bool
    @Published public var hasFullAccess: Bool
    @Published public var locale: Locale
    @Published public var needsInputModeSwitchKey: Bool
    @Published public var primaryLanguage: String?
    @Published public var textDocumentProxy: UITextDocumentProxy
    @Published public var textInputMode: UITextInputMode?
    @Published public var traitCollection: UITraitCollection
}
