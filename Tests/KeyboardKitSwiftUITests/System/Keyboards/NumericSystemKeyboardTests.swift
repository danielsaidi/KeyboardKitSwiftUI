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
        
        let context = MockKeyboardContext()
        
        describe("numeric system keyboard") {
            
            func view(set: NumericKeyboardInputSet) -> some View {
                NumericSystemKeyboard(
                    context: context,
                    inputSet: set,
                    customBottomRow: .empty)
            }
            
            it("can be created with English input set") {
                expect(view(set: .englishNumeric)).toNot(beNil())
            }
            
            it("can be created with optional views and actions") {
                let view = NumericSystemKeyboard(
                    context: context,
                    inputSet: .englishNumeric,
                    topmostView: AnyView(Text("Hello")),
                    customBottomRow: .empty)
                expect(view).toNot(beNil())
            }
            
            it("fails if input set has less than 3 rows") {
                let set = NumericKeyboardInputSet(inputRows: [["1"], ["2"]])
                expect({ _ = view(set: set) }()).to(throwAssertion())
            }
        }
    }
}
