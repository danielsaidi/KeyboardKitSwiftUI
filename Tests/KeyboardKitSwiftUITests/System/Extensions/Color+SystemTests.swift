//
//  Color+SystemTests.swift
//  KeyboardKitTests
//
//  Created by Daniel Saidi on 2020-06-24.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import KeyboardKit
import SwiftUI
@testable import KeyboardKitSwiftUI

class Color_SystemTests: QuickSpec {

    override func spec() {
        
        func context(_ userInterfaceStyle: UIUserInterfaceStyle, _ keyboardAppearance: UIKeyboardAppearance) -> MockKeyboardContext {
            MockKeyboardContext(userInterfaceStyle, keyboardAppearance)
        }
        
        func result(for color: Color) -> Color { color }
        
        describe("dark system keyboard button background color") {
            
            it("varies for different schemes and appearances") {
//                expect(result(for: .systemKeyboardButtonBackgroundColorDark(for: context(.dark, .dark)))).to(equal(.systemKeyboardButtonBackgroundColorDarkForDarkColorScheme))
//                expect(result(for: .systemKeyboardButtonBackgroundColorDark(for: context(.dark, .light)))).to(equal(.systemKeyboardButtonBackgroundColorDarkForDarkColorScheme))
//                expect(result(for: .systemKeyboardButtonBackgroundColorDark(for: context(.light, .dark)))).to(equal(.systemKeyboardButtonBackgroundColorDarkForLightColorSchemeAndDarkKeyboardAppearance))
//                expect(result(for: .systemKeyboardButtonBackgroundColorDark(for: context(.light, .light)))).to(equal(.systemKeyboardButtonBackgroundColorDarkForLightColorSchemeAndLightKeyboardAppearance))
            }
        }
        
        describe("light system keyboard button background color") {
            
            it("varies for different schemes and appearances") {
//                expect(result(for: .systemKeyboardButtonBackgroundColorLight(for: context(.dark, .dark)))).to(equal(.systemKeyboardButtonBackgroundColorLightForDarkColorScheme))
//                expect(result(for: .systemKeyboardButtonBackgroundColorLight(for: context(.dark, .light)))).to(equal(.systemKeyboardButtonBackgroundColorLightForDarkColorScheme))
//                expect(result(for: .systemKeyboardButtonBackgroundColorLight(for: context(.light, .dark)))).to(equal(.systemKeyboardButtonBackgroundColorLightForLightColorSchemeAndDarkKeyboardAppearance))
//                expect(result(for: .systemKeyboardButtonBackgroundColorLight(for: context(.light, .light)))).to(equal(.systemKeyboardButtonBackgroundColorLightForLightColorSchemeAndLightKeyboardAppearance))
            }
        }
        
        describe("system keyboard button background color") {
            
            it("varies for different schemes and appearances") {
                expect(result(for: .systemKeyboardButtonBackgroundColorDarkForDarkColorScheme)).to(equal(Color(rgb: 71.0/255.0)))
                expect(result(for: .systemKeyboardButtonBackgroundColorDarkForLightColorSchemeAndDarkKeyboardAppearance)).to(equal(Color(rgb: 117.0/255.0)))
                expect(result(for: .systemKeyboardButtonBackgroundColorDarkForLightColorSchemeAndLightKeyboardAppearance)).to(equal(Color(red: 179.0/255.0, green: 184.0/255.0, blue: 193.0/255.0)))
                expect(result(for: .systemKeyboardButtonBackgroundColorLightForDarkColorScheme)).to(equal(Color(rgb: 107.0/255.0)))
                expect(result(for: .systemKeyboardButtonBackgroundColorLightForLightColorSchemeAndDarkKeyboardAppearance)).to(equal(Color(rgb: 150.0/255.0)))
                expect(result(for: .systemKeyboardButtonBackgroundColorLightForLightColorSchemeAndLightKeyboardAppearance)).to(equal(.white))
            }
        }
        
        describe("system keyboard button foreground color") {
            
            it("varies for different schemes and appearances") {
//                expect(result(for: .systemKeyboardButtonForegroundColor(for: context(.dark, .dark)))).to(equal(.primary))
//                expect(result(for: .systemKeyboardButtonForegroundColor(for: context(.dark, .light)))).to(equal(.primary))
//                expect(result(for: .systemKeyboardButtonForegroundColor(for: context(.light, .dark)))).to(equal(.white))
//                expect(result(for: .systemKeyboardButtonForegroundColor(for: context(.light, .light)))).to(equal(.primary))
            }
        }
        
        describe("system keyboard button shadow color") {
            
            it("is 30% black") {
                let expected = Color.black.opacity(0.3)
                expect(result(for: .systemKeyboardButtonShadowColor(for: context(.dark, .dark)))).to(equal(expected))
                expect(result(for: .systemKeyboardButtonShadowColor(for: context(.dark, .light)))).to(equal(expected))
                expect(result(for: .systemKeyboardButtonShadowColor(for: context(.light, .dark)))).to(equal(expected))
                expect(result(for: .systemKeyboardButtonShadowColor(for: context(.light, .light)))).to(equal(expected))
            }
        }
    }
}
