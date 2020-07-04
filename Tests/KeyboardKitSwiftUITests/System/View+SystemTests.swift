//
//  View+System.swift
//  KeyboardKitTests
//
//  Created by Daniel Saidi on 2020-06-24.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import KeyboardKit
import KeyboardKitSwiftUI
import SwiftUI

class View_SystemKeyboardStylesTests: QuickSpec {

    override func spec() {
        
        let controller = KeyboardInputViewController()
        let actionHandler = StandardKeyboardActionHandler(inputViewController: controller)
        let context = StandardKeyboardContext(controller: controller, actionHandler: actionHandler, keyboardType: .email)
        
        describe("system keyboard button style") {
            
            it("is defined for context") {
                let result = Text("")
                    .systemKeyboardButtonStyle(for: .backspace, scheme: .dark, context: context)
                expect(result).toNot(beNil())
            }
            
            it("is defined for appearance") {
                let result = Text("")
                    .systemKeyboardButtonStyle(for: .backspace, scheme: .dark, appearance: .dark)
                expect(result).toNot(beNil())
            }
        }
            
        describe("system keyboard button background") {
            
            it("is defined") {
                let background = Text("").systemKeyboardButtonBackground(for: .backspace, scheme: .dark, appearance: .light)
                expect(background).toNot(beNil())
            }
        }
        
        describe("system keyboard button corner radius") {
            
            it("is defined") {
                let value = Text("").systemKeyboardButtonCornerRadius()
                expect(value).toNot(beNil())
            }
        }
        
        describe("system keyboard button font") {
            
            it("is defined") {
                let font = Text("").systemKeyboardButtonFont(for: .backspace)
                expect(font).toNot(beNil())
            }
        }
        
        describe("system keyboard button foreground") {
            
            it("is defined") {
                let Foreground = Text("").systemKeyboardButtonForeground(forScheme: .dark, appearance: .light)
                expect(Foreground).toNot(beNil())
            }
        }
        
        describe("system keyboard button frame") {
            
            it("is defined") {
                let value = Text("").systemKeyboardButtonFrame()
                expect(value).toNot(beNil())
            }
        }
        
        describe("system keyboard button shadow") {
            
            it("is defined") {
                let value = Text("").systemKeyboardButtonShadow(forScheme: .dark, appearance: .light)
                expect(value).toNot(beNil())
            }
        }
    }
}
