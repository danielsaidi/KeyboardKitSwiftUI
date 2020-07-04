//
//  NumericSystemKeyboardTests.swift
//  KeyboardKitTests
//
//  Created by Daniel Saidi on 2020-07-04.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import KeyboardKit
import KeyboardKitSwiftUI
import SwiftUI

class NumericSystemKeyboardTests: QuickSpec {

    override func spec() {
        
        describe("numeric system keyboard") {
            
            it("can be created with English input set") {
                let view = NumericSystemKeyboard(
                    inputSet: .englishNumeric)
                expect(view).toNot(beNil())
            }
            
            it("can be created with optional topmost view") {
                let view = NumericSystemKeyboard(
                    inputSet: .englishNumeric,
                    topmostView: AnyView(Text("Hello")))
                expect(view).toNot(beNil())
            }
            
            it("fails if input set has less than 3 rows") {
                let set = NumericKeyboardInputSet(inputRows: [["1"], ["2"]])
                expect({ _ = NumericSystemKeyboard(inputSet: set) }())
                    .to(throwAssertion())
            }
            
            it("fails if input set has more than 3 rows") {
                let set = NumericKeyboardInputSet(inputRows: [["1"], ["2"], ["3"], ["4"]])
                expect({ _ = NumericSystemKeyboard(inputSet: set) }())
                    .to(throwAssertion())
            }
        }
    }
}
