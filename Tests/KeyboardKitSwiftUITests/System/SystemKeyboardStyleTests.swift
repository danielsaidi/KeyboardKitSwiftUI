//
//  SystemKeyboardStyleTests.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2020-07-04.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import KeyboardKitSwiftUI

class SystemKeyboardButtonStyleTests: QuickSpec {

    override func spec() {
        
        describe("system keyboard button button style") {
            
            it("has predefined but settable values") {
                expect(SystemKeyboardStyle.backspaceWidth).to(equal(50.0))
                expect(SystemKeyboardStyle.bottomRowSpacePercentage).to(equal(0.5))
                expect(SystemKeyboardStyle.buttonSpacing).to(equal(6.0))
                expect(SystemKeyboardStyle.cornerRadius).to(equal(4.0))
                expect(SystemKeyboardStyle.frameHeight).to(equal(42.0))
                expect(SystemKeyboardStyle.rowSpacing).to(equal(12.0))
                expect(SystemKeyboardStyle.shiftWidth).to(equal(50.0))
            }
        }
    }
}
