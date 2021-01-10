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
    
    var controller: KeyboardInputViewController = KeyboardInputViewController()
    
    var actionHandler: KeyboardActionHandler = MockKeyboardActionHandler()
    var keyboardAppearanceProvider: KeyboardAppearanceProvider = StandardKeyboardAppearanceProvider()
    var keyboardBehavior: KeyboardBehavior = StandardKeyboardBehavior()
    var keyboardInputSetProvider: KeyboardInputSetProvider = StaticKeyboardInputSetProvider.empty
    var keyboardLayoutProvider: KeyboardLayoutProvider = StandardKeyboardLayoutProvider()
    var secondaryCalloutActionProvider: SecondaryCalloutActionProvider = StandardSecondaryCalloutActionProvider()
    
    var device: UIDevice = .current
    var deviceOrientation: UIInterfaceOrientation = .portrait
    var emojiCategory: EmojiCategory = .frequent
    var hasDictationKey = false
    var hasFullAccess = false
    var keyboardAppearance: UIKeyboardAppearance = .dark
    var keyboardType: KeyboardType = .alphabetic(.lowercased)
    var locale: Locale = .current
    var needsInputModeSwitchKey = false
    var primaryLanguage: String?
    var textDocumentProxy: UITextDocumentProxy = UIInputViewController().textDocumentProxy
    var textInputMode: UITextInputMode?
    var traitCollection: UITraitCollection = .current
    var userInterfaceStyle: UIUserInterfaceStyle = .light
}
