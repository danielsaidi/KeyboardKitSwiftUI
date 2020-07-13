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
            
            it("is defined") {
                let result = Text("").systemKeyboardButtonStyle(for: .backspace, context: context, style: .standard)
                expect(result).toNot(beNil())
            }
        }
            
        describe("system keyboard button background") {
            
            it("is defined") {
                let background = Text("").systemKeyboardButtonBackground(for: .backspace, context: context)
                expect(background).toNot(beNil())
            }
        }
        
        describe("system keyboard button corner radius") {
            
            it("is defined") {
                let value = Text("").systemKeyboardButtonCornerRadius(for: .standard)
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
                let Foreground = Text("").systemKeyboardButtonForeground(for: context)
                expect(Foreground).toNot(beNil())
            }
        }
        
        describe("system keyboard button frame") {
            
            it("is defined") {
                let value = Text("").systemKeyboardButtonFrame(for: .standard)
                expect(value).toNot(beNil())
            }
        }
        
        describe("system keyboard button shadow") {
            
            it("is defined") {
                let value = Text("").systemKeyboardButtonShadow(for: context)
                expect(value).toNot(beNil())
            }
        }
    }
}
