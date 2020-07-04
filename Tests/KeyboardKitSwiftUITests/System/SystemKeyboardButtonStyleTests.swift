//
//  SystemKeyboardButtonStyleTests.swift
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
                expect(SystemKeyboardButtonStyle.bottomRowSpacePercentage).to(equal(0.5))
                expect(SystemKeyboardButtonStyle.cornerRadius).to(equal(4.0))
                expect(SystemKeyboardButtonStyle.frameHeight).to(equal(42.0))
                expect(SystemKeyboardButtonStyle.rowSpacing).to(equal(6.0))
            }
        }
    }
}
