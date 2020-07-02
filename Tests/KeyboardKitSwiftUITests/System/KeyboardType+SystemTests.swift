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
            
            func result(for type: KeyboardType) -> Image? {
                type.systemKeyboardButtonImage
            }
            
            it("is defined for some types") {
                expect(result(for: .alphabetic(.capsLocked))).to(equal(.shiftCapslocked))
                expect(result(for: .alphabetic(.lowercased))).to(equal(.shiftLowercased))
                expect(result(for: .alphabetic(.uppercased))).to(equal(.shiftUppercased))
                expect(result(for: .email)).to(equal(.email))
                expect(result(for: .emojis)).to(equal(.emoji))
                expect(result(for: .images)).to(equal(.images))
                
                expect(result(for: .custom(""))).to(beNil())
                expect(result(for: .numeric)).to(beNil())
                expect(result(for: .symbolic)).to(beNil())
            }
        }
    }
}
