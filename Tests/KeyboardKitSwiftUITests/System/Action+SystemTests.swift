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
        
        let actions = KeyboardAction.testActions
        
        var expected: [KeyboardAction]! {
            didSet {
                unexpected = actions
                expected.forEach { action in
                    unexpected.removeAll { $0 == action }
                }
            }
        }
        
        var unexpected: [KeyboardAction]!
        
        beforeEach {
            expected = []
            unexpected = []
        }
        
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
        
        describe("system keyboard button image") {
            
            func result(for action: KeyboardAction) -> Image? {
                action.systemKeyboardButtonImage
            }
            
            it("is defined for some actions") {
                expected = [
                    .backspace,
                    .capsLock,
                    .command,
                    .control,
                    .dictation,
                    .image(description: "", keyboardImageName: "", imageName: ""),
                    .moveCursorBackward,
                    .moveCursorForward,
                    .newLine,
                    .nextKeyboard,
                    .option,
                    .shift,
                    .shiftDown,
                    .systemImage(description: "", keyboardImageName: "", imageName: ""),
                    .tab,
                ]
                expected.forEach { expect(result(for: $0)).toNot(beNil()) }
                unexpected.forEach { expect(result(for: $0)).to(beNil()) }
            }
        }
        
        describe("system keyboard button text") {
            
            func result(for action: KeyboardAction) -> Text? {
                action.systemKeyboardButtonText
            }
            
            it("is defined for some actions") {
                expected = [
                    .character(""),
                    .emoji("")
                ]
                expected.forEach { expect(result(for: $0)).toNot(beNil()) }
                unexpected.forEach { expect(result(for: $0)).to(beNil()) }
            }
        }
        
        describe("system keyboard button shadow color") {
            
            func result(for action: KeyboardAction) -> Color {
                action.systemKeyboardButtonShadowColor(forScheme: .dark, appearance: .dark)
            }
            
            it("is clear for emoji, not others") {
                expected = [.emoji("")]
                expected.forEach { expect(result(for: $0)).to(equal(.clear)) }
                unexpected.forEach { expect(result(for: $0)).toNot(equal(.clear)) }
            }
        }
    }
}
