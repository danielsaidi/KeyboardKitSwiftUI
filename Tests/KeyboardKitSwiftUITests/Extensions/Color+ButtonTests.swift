//
//  Color+ButtonTests.swift
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

class Color_ButtonTests: QuickSpec {

    override func spec() {
        
        func context(_ userInterfaceStyle: UIUserInterfaceStyle, _ keyboardAppearance: UIKeyboardAppearance) -> MockKeyboardContext {
            let context = MockKeyboardContext()
            context.userInterfaceStyle = userInterfaceStyle
            context.keyboardAppearance = keyboardAppearance
            return context
        }
        
        func result(for color: Color) -> Color { color }
        
        describe("standard button shadow color") {
            
            it("is 30% black") {
                let expected = Color.black.opacity(0.3)
                expect(result(for: .standardButtonShadowColor(for: context(.dark, .dark)))).to(equal(expected))
                expect(result(for: .standardButtonShadowColor(for: context(.dark, .light)))).to(equal(expected))
                expect(result(for: .standardButtonShadowColor(for: context(.light, .dark)))).to(equal(expected))
                expect(result(for: .standardButtonShadowColor(for: context(.light, .light)))).to(equal(expected))
            }
        }
        
        describe("standard dark button background color") {
            
            it("varies for different schemes and appearances") {
//                expect(result(for: .systemKeyboardButtonBackgroundColorDark(for: context(.dark, .dark)))).to(equal(.systemKeyboardButtonBackgroundColorDarkForDarkColorScheme))
//                expect(result(for: .systemKeyboardButtonBackgroundColorDark(for: context(.dark, .light)))).to(equal(.systemKeyboardButtonBackgroundColorDarkForDarkColorScheme))
//                expect(result(for: .systemKeyboardButtonBackgroundColorDark(for: context(.light, .dark)))).to(equal(.systemKeyboardButtonBackgroundColorDarkForLightColorSchemeAndDarkKeyboardAppearance))
//                expect(result(for: .systemKeyboardButtonBackgroundColorDark(for: context(.light, .light)))).to(equal(.systemKeyboardButtonBackgroundColorDarkForLightColorSchemeAndLightKeyboardAppearance))
            }
        }
        
        describe("standard light button background color") {
            
            it("varies for different schemes and appearances") {
//                expect(result(for: .systemKeyboardButtonBackgroundColorLight(for: context(.dark, .dark)))).to(equal(.systemKeyboardButtonBackgroundColorLightForDarkColorScheme))
//                expect(result(for: .systemKeyboardButtonBackgroundColorLight(for: context(.dark, .light)))).to(equal(.systemKeyboardButtonBackgroundColorLightForDarkColorScheme))
//                expect(result(for: .systemKeyboardButtonBackgroundColorLight(for: context(.light, .dark)))).to(equal(.systemKeyboardButtonBackgroundColorLightForLightColorSchemeAndDarkKeyboardAppearance))
//                expect(result(for: .systemKeyboardButtonBackgroundColorLight(for: context(.light, .light)))).to(equal(.systemKeyboardButtonBackgroundColorLightForLightColorSchemeAndLightKeyboardAppearance))
            }
        }
        
        describe("standard button background color") {
            
            it("varies for different schemes and appearances") {
                expect(result(for: .standardDarkButtonBackgroundColorForDarkColorScheme)).to(equal(Color(rgb: 71.0/255.0)))
                expect(result(for: .standardDarkButtonBackgroundColorForLightColorSchemeAndDarkKeyboardAppearance)).to(equal(Color(rgb: 117.0/255.0)))
                expect(result(for: .standardDarkButtonBackgroundColorForLightColorSchemeAndLightKeyboardAppearance)).to(equal(Color(red: 179.0/255.0, green: 184.0/255.0, blue: 193.0/255.0)))
                expect(result(for: .standardLightButtonBackgroundColorForDarkColorScheme)).to(equal(Color(rgb: 107.0/255.0)))
                expect(result(for: .standardLightButtonBackgroundColorForLightColorSchemeAndDarkKeyboardAppearance)).to(equal(Color(rgb: 150.0/255.0)))
                expect(result(for: .standardLightButtonBackgroundColorForLightColorSchemeAndLightKeyboardAppearance)).to(equal(.white))
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
    }
}
