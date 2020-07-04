//
//  KeyboardShiftState+SystemTests.swift
//  KeyboardKitTests
//
//  Created by Daniel Saidi on 2020-07-02.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import KeyboardKit
import KeyboardKitSwiftUI
import SwiftUI

class KeyboardShiftState_SystemTests: QuickSpec {

    override func spec() {
        
        describe("system image") {
            
            func result(for state: KeyboardShiftState) -> Image {
                state.systemImage
            }
            
            it("is defined for all states") {
                expect(result(for: .capsLocked)).to(equal(.shiftCapslocked))
                expect(result(for: .lowercased)).to(equal(.shiftLowercased))
                expect(result(for: .uppercased)).to(equal(.shiftUppercased))
            }
        }
        
        describe("system keyboard button image") {
            
            func result(for state: KeyboardShiftState, contextType: KeyboardType) -> Image {
                let controller = KeyboardInputViewController()
                let handler = MockKeyboardActionHandler()
                let context = StandardKeyboardContext(controller: controller, actionHandler: handler, keyboardType: contextType)
                return state.systemKeyboardButtonImage(for: context)
            }
            
            it("is defined for all states") {
                expect(result(for: .capsLocked, contextType: .alphabetic(.lowercased))).to(equal(.shiftLowercased))
                expect(result(for: .lowercased, contextType: .alphabetic(.uppercased))).to(equal(.shiftUppercased))
                expect(result(for: .uppercased, contextType: .alphabetic(.lowercased))).to(equal(.shiftLowercased))
                
                expect(result(for: .capsLocked, contextType: .emojis)).to(equal(.shiftCapslocked))
                expect(result(for: .lowercased, contextType: .emojis)).to(equal(.shiftLowercased))
                expect(result(for: .uppercased, contextType: .emojis)).to(equal(.shiftUppercased))
            }
        }
    }
}
