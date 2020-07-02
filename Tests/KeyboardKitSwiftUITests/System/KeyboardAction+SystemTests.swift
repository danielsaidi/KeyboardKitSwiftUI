//
//  KeyboardAction+SystemTests.swift
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
                let controller = KeyboardInputViewController()
                let handler = MockKeyboardActionHandler()
                let context = StandardKeyboardContext(controller: controller, actionHandler: handler, keyboardType: .email)
                return action.systemKeyboardButtonImage(for: context)
            }
            
            it("is defined for some actions") {
                expect(result(for: .backspace)).to(equal(.backspace))
                expect(result(for: .command)).to(equal(.command))
                expect(result(for: .control)).to(equal(.control))
                expect(result(for: .dictation)).to(equal(.dictation))
                expect(result(for: .keyboardType(.email))).to(equal(.email))
                expect(result(for: .moveCursorBackward)).to(equal(.moveCursorLeft))
                expect(result(for: .moveCursorForward)).to(equal(.moveCursorRight))
                expect(result(for: .newLine)).to(equal(.newLine))
                expect(result(for: .nextKeyboard)).to(equal(.globe))
                expect(result(for: .option)).to(equal(.option))
                expect(result(for: .shift(currentState: .lowercased))).to(equal(.shiftLowercased))
                expect(result(for: .shift(currentState: .uppercased))).to(equal(.shiftUppercased))
                expect(result(for: .shift(currentState: .capsLocked))).to(equal(.shiftCapslocked))
                expect(result(for: .tab)).to(equal(.tab))
                
                expect(result(for: .none)).to(beNil())
                expect(result(for: .character(""))).to(beNil())
                expect(result(for: .custom(name: ""))).to(beNil())
                expect(result(for: .dismissKeyboard)).to(beNil())
                expect(result(for: .emoji(""))).to(beNil())
                expect(result(for: .emojiCategory(.activities))).to(beNil())
                expect(result(for: .escape)).to(beNil())
                expect(result(for: .function)).to(beNil())
                expect(result(for: .space)).to(beNil())
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
