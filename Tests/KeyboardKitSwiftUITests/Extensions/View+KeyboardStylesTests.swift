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
        
        describe("system font for action") {
            
            it("is defined") {
                let font = Text("").systemKeyboardButtonFont(for: .backspace)
                expect(font).toNot(beNil())
            }
        }
        
        describe("system shadow") {
            
            it("is defined") {
                let value = Text("").systemKeyboardButtonShadow()
                expect(value).toNot(beNil())
            }
        }
        
        describe("system shadow color") {
            
            it("is defined") {
                let value = Text("").systemKeyboardButtonShadowColor
                expect(value).toNot(beNil())
            }
        }
    }
}
