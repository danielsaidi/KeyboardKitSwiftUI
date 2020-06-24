//
//  View+KeyboardStylesTests.swift
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

class View_KeyboardStylesTests: QuickSpec {

    override func spec() {
        
        let controller = KeyboardInputViewController()
        let actionHandler = StandardKeyboardActionHandler(inputViewController: controller)
        let context = StandardKeyboardContext(controller: controller, actionHandler: actionHandler, keyboardType: .email)
        
        describe("system keyboard button") {
            
            it("is defined") {
                let result = Text("")
                    .systemKeyboardButton(.backspace, scheme: .dark, context: context)
                expect(result).toNot(beNil())
            }
        }
        
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
                let background = Text("").systemKeyboardButtonBackground(for: .dark, appearance: .light)
                expect(background).toNot(beNil())
            }
        }
        
        describe("system keyboard button background color") {
            
            it("varies for different schemes and appearances") {
                let lightLight = Text("").systemKeyboardButtonBackgroundColor(for: .light, appearance: .light)
                let lightDark = Text("").systemKeyboardButtonBackgroundColor(for: .light, appearance: .dark)
                let darkLight = Text("").systemKeyboardButtonBackgroundColor(for: .dark, appearance: .light)
                let darkDark = Text("").systemKeyboardButtonBackgroundColor(for: .dark, appearance: .dark)
                expect(lightLight).toNot(equal(lightDark))
                expect(lightLight).toNot(equal(darkLight))
                expect(lightLight).toNot(equal(darkDark))
                expect(lightDark).toNot(equal(darkLight))
                expect(lightDark).toNot(equal(darkDark))
                expect(darkLight).to(equal(darkDark))
            }
        }
        
        describe("system keyboard button corner radius") {
            
            it("is defined") {
                let value = Text("").systemKeyboardButtonCornerRadius()
                expect(value).toNot(beNil())
            }
        }
        
        describe("system keyboard button corner radius value") {
            
            it("is defined") {
                let value = Text("").systemKeyboardButtonCornerRadiusValue
                expect(value).to(equal(4))
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
                let Foreground = Text("").systemKeyboardButtonForeground(for: .dark, appearance: .light)
                expect(Foreground).toNot(beNil())
            }
        }
        
        describe("system keyboard button foreground color") {
            
            it("varies for different schemes and appearances") {
                let lightLight = Text("").systemKeyboardButtonForegroundColor(for: .light, appearance: .light)
                let lightDark = Text("").systemKeyboardButtonForegroundColor(for: .light, appearance: .dark)
                let darkLight = Text("").systemKeyboardButtonForegroundColor(for: .dark, appearance: .light)
                let darkDark = Text("").systemKeyboardButtonForegroundColor(for: .dark, appearance: .dark)
                expect(lightLight).toNot(equal(lightDark))
                expect(lightLight).to(equal(darkLight))
                expect(lightLight).to(equal(darkDark))
                expect(lightDark).to(equal(.white))
            }
        }
        
        describe("system keyboard button frame") {
            
            it("is defined") {
                let value = Text("").systemKeyboardButtonFrame()
                expect(value).toNot(beNil())
            }
        }
        
        describe("system keyboard button frame height value") {
            
            it("is defined") {
                let value = Text("").systemKeyboardButtonFrameHeightValue
                expect(value).to(equal(42))
            }
        }
        
        describe("system keyboard button shadow") {
            
            it("is defined") {
                let value = Text("").systemKeyboardButtonShadow(for: .dark, appearance: .light)
                expect(value).toNot(beNil())
            }
        }
        
        describe("system keyboard button shadow color") {
            
            it("is defined") {
                let value = Text("").systemKeyboardButtonShadowColor
                expect(value).toNot(beNil())
            }
        }
        
        describe("system keyboard button text shadow") {
            
            it("is defined") {
                let value = Text("").systemKeyboardButtonTextShadow(for: .dark, appearance: .default)
                expect(value).toNot(beNil())
            }
        }
        
        describe("system keyboard button text shadow color") {
            
            it("is defined") {
                let value = Text("").systemKeyboardButtonTextShadowColor
                expect(value).toNot(beNil())
            }
        }
    }
}
