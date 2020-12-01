//
//  MockKeyboardContext.swift
//  KeyboardKitTests
//
//  Created by Daniel Saidi on 2020-07-02.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation
import KeyboardKit
import UIKit

class MockKeyboardContext: KeyboardContext {
    
    init() {}
    
    init(_ userInterfaceStyle: UIUserInterfaceStyle, _ keyboardAppearance: UIKeyboardAppearance) {
        self.userInterfaceStyleValue = userInterfaceStyle
        self.keyboardAppearanceValue = keyboardAppearance
    }
    
    var actionHandler: KeyboardActionHandler = MockKeyboardActionHandler()
    var controller: KeyboardInputViewController = KeyboardInputViewController()
    var emojiCategory: EmojiCategory = .frequent
    var hasDictationKey = false
    var hasFullAccess = false
    lazy var inputSetProvider: KeyboardInputSetProvider = { fatalError("Not supported yet") }()
    var keyboardAppearanceValue: UIKeyboardAppearance = .light
    var keyboardAppearance: UIKeyboardAppearance { keyboardAppearanceValue }
    var keyboardType: KeyboardType = .alphabetic(.lowercased)
    var needsInputModeSwitchKey = false
    var primaryLanguage: String?
    var textDocumentProxy: UITextDocumentProxy = UIInputViewController().textDocumentProxy
    var textInputMode: UITextInputMode?
    var traitCollection: UITraitCollection = .current
    var userInterfaceStyleValue: UIUserInterfaceStyle = .light
    var userInterfaceStyle: UIUserInterfaceStyle { userInterfaceStyleValue }
}
