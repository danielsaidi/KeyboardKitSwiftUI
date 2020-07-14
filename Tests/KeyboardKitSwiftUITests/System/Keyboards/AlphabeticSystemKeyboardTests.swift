//
//  AlphabeticSystemKeyboardTests.swift
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

class AlphabeticSystemKeyboardTests: QuickSpec {

    override func spec() {
        
        let context = MockKeyboardContext()
        
        describe("alphabetic system keyboard") {
            
            func view(set: AlphabeticKeyboardInputSet) -> some View {
                AlphabeticSystemKeyboard(
                    context: context,
                    inputSet: set,
                    state: .lowercased,
                    customBottomRow: .empty)
            }
            
            it("can be created with English input set") {
                expect(view(set: .english)).toNot(beNil())
            }
            
            it("can be created with optional views and actions") {
                let view = AlphabeticSystemKeyboard(
                    context: context,
                    inputSet: .english,
                    state: .lowercased,
                    topmostView: AnyView(Text("Hello")),
                    customBottomRow: .empty)
                expect(view).toNot(beNil())
            }
            
            it("fails if input set has less than 3 rows") {
                let set = AlphabeticKeyboardInputSet(inputRows: [["1"], ["2"]])
                expect({ _ = view(set: set) }()).to(throwAssertion())
            }
        }
    }
}
