//
//  Action+SystemTests.swift
//  KeyboardKitTests
//
//  Created by Daniel Saidi on 2020-07-01.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import KeyboardKit
import SwiftUI
@testable import KeyboardKitSwiftUI

class Action_SystemTests: QuickSpec {

    override func spec() {
        
        describe("system keyboard button background color") {
            
            it("is uses a dark button for system actions, else light") {
                KeyboardAction.testActions.forEach {
                    if case .emoji = $0 {
                        expect($0.systemKeyboardButtonBackgroundColor(forScheme: .dark, appearance: .dark)).to(equal(.clearInteractable))
                        expect($0.systemKeyboardButtonBackgroundColor(forScheme: .dark, appearance: .light)).to(equal(.clearInteractable))
                        expect($0.systemKeyboardButtonBackgroundColor(forScheme: .light, appearance: .dark)).to(equal(.clearInteractable))
                        expect($0.systemKeyboardButtonBackgroundColor(forScheme: .light, appearance: .light)).to(equal(.clearInteractable))
                    } else if $0.isSystemAction {
                        expect($0.systemKeyboardButtonBackgroundColor(forScheme: .dark, appearance: .dark)).to(equal(.systemKeyboardButtonBackgroundColorDarkForDarkColorScheme))
                        expect($0.systemKeyboardButtonBackgroundColor(forScheme: .dark, appearance: .light)).to(equal(.systemKeyboardButtonBackgroundColorDarkForDarkColorScheme))
                        expect($0.systemKeyboardButtonBackgroundColor(forScheme: .light, appearance: .dark)).to(equal(.systemKeyboardButtonBackgroundColorDarkForLightColorSchemeAndDarkKeyboardAppearance))
                        expect($0.systemKeyboardButtonBackgroundColor(forScheme: .light, appearance: .light)).to(equal(.systemKeyboardButtonBackgroundColorDarkForLightColorSchemeAndLightKeyboardAppearance))
                    } else {
                        expect($0.systemKeyboardButtonBackgroundColor(forScheme: .dark, appearance: .dark)).to(equal(.systemKeyboardButtonBackgroundColorLightForDarkColorScheme))
                        expect($0.systemKeyboardButtonBackgroundColor(forScheme: .dark, appearance: .light)).to(equal(.systemKeyboardButtonBackgroundColorLightForDarkColorScheme))
                        expect($0.systemKeyboardButtonBackgroundColor(forScheme: .light, appearance: .dark)).to(equal(.systemKeyboardButtonBackgroundColorLightForLightColorSchemeAndDarkKeyboardAppearance))
                        expect($0.systemKeyboardButtonBackgroundColor(forScheme: .light, appearance: .light)).to(equal(.systemKeyboardButtonBackgroundColorLightForLightColorSchemeAndLightKeyboardAppearance))
                    }
                }
            }
        }
    }
}
