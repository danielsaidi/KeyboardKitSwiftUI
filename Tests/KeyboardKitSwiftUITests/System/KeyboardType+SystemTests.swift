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

class KeyboardType_SystemTests: QuickSpec {

    override func spec() {
        
        describe("system keyboard button image") {
            
            func result(for type: KeyboardType, contextType: KeyboardType) -> Image? {
                let controller = KeyboardInputViewController()
                let handler = MockKeyboardActionHandler()
                let context = StandardKeyboardContext(controller: controller, actionHandler: handler, keyboardType: contextType)
                return type.systemKeyboardButtonImage(for: context)
            }
            
            it("is defined for some types") {
                expect(result(for: .alphabetic(.capsLocked), contextType: .alphabetic(.lowercased))).to(equal(.shiftLowercased))
                expect(result(for: .alphabetic(.lowercased), contextType: .alphabetic(.uppercased))).to(equal(.shiftUppercased))
                expect(result(for: .alphabetic(.uppercased), contextType: .alphabetic(.lowercased))).to(equal(.shiftLowercased))
                
                expect(result(for: .alphabetic(.capsLocked), contextType: .email)).to(equal(.shiftCapslocked))
                expect(result(for: .alphabetic(.lowercased), contextType: .email)).to(equal(.shiftLowercased))
                expect(result(for: .alphabetic(.uppercased), contextType: .email)).to(equal(.shiftUppercased))
                
                expect(result(for: .email, contextType: .symbolic)).to(equal(.email))
                expect(result(for: .emojis, contextType: .email)).to(equal(.emoji))
                expect(result(for: .images, contextType: .numeric)).to(equal(.images))
                
                expect(result(for: .custom(""), contextType: .email)).to(beNil())
                expect(result(for: .numeric, contextType: .email)).to(beNil())
                expect(result(for: .symbolic, contextType: .email)).to(beNil())
            }
        }
    }
}
