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
    
    var actionHandler: KeyboardActionHandler = MockKeyboardActionHandler()
    var hasDictationKey = false
    var hasFullAccess = false
    var keyboardType: KeyboardType = .alphabetic(.lowercased)
    var needsInputModeSwitchKey = false
    var textDocumentProxy: UITextDocumentProxy = UIInputViewController().textDocumentProxy
    var textInputMode: UITextInputMode?
    var primaryLanguage: String?
}
