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
    
    public init(
        actionHandler: KeyboardActionHandler,
        keyboardType: KeyboardType = .alphabetic(.lowercased)) {
        self.actionHandler = actionHandler
        self.keyboardType = keyboardType
    }
    
    public init(from context: KeyboardContext) {
        actionHandler = context.actionHandler
        hasFullAccess = context.hasFullAccess
        keyboardType = context.keyboardType
        needsInputModeSwitchKey = context.needsInputModeSwitchKey
    }
    
    @Published public var actionHandler: KeyboardActionHandler
    @Published public var hasFullAccess = false
    @Published public var keyboardType: KeyboardType
    @Published public var needsInputModeSwitchKey = false
}
