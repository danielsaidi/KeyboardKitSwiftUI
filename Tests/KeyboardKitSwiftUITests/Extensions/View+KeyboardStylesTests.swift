//
//  View+KeyboardStylesTests.swift
//  KeyboardKitTests
//
//  Created by Daniel Saidi on 2020-06-24.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import KeyboardKitSwiftUI
import SwiftUI

class View_KeyboardStylesTests: QuickSpec {

    override func spec() {
        
        describe("system keyboard button background") {
            
            it("is defined") {
                let background = Text("").systemKeyboardButtonBackground(for: .dark, appearance: .light)
                expect(background).toNot(beNil())
            }
        }
        
        describe("system keyboard button background color") {
            
            it("prioritizes dark color scheme, then dark appearance, then light appearance") {
                let darkScheme = Text("").systemKeyboardButtonBackgroundColor(for: .dark, appearance: .light)
                let darkAppearance = Text("").systemKeyboardButtonBackgroundColor(for: .light, appearance: .dark)
                let lightAppearance = Text("").systemKeyboardButtonBackgroundColor(for: .light, appearance: .light)
                expect(darkScheme).toNot(equal(darkAppearance))
                expect(darkScheme).toNot(equal(lightAppearance))
                expect(darkAppearance).toNot(equal(lightAppearance))
            }
        }
        
        describe("system keyboard button font") {
            
            it("is defined") {
                let font = Text("").systemKeyboardButtonFont(for: .backspace)
                expect(font).toNot(beNil())
            }
        }
        
        describe("system keyboard button shadow") {
            
            it("is defined") {
                let value = Text("").systemKeyboardButtonShadow()
                expect(value).toNot(beNil())
            }
        }
        
        describe("system keyboard button shadow color") {
            
            it("is defined") {
                let value = Text("").systemKeyboardButtonShadowColor
                expect(value).toNot(beNil())
            }
        }
    }
}
