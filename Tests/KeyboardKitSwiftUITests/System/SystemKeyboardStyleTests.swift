//
//  SystemKeyboardStyleTests.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2020-07-04.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import SwiftUI
import KeyboardKitSwiftUI

class SystemKeyboardButtonStyleTests: QuickSpec {

    override func spec() {
        
        describe("system keyboard button button style") {
            
            it("has predefined but settable values") {
                let style = SystemKeyboardStyle.standard
                expect(style.backspaceWidth).to(equal(50.0))
                expect(style.bottomRowSpacePercentage).to(equal(0.5))
                expect(style.buttonCornerRadius).to(equal(4.0))
                expect(style.buttonHeight).to(equal(42.0))
                expect(style.buttonSpacing).to(equal(6.0))
                expect(style.padding).to(equal(EdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4)))
                expect(style.rowSpacing).to(equal(12.0))
                expect(style.shiftWidth).to(equal(50.0))
            }
        }
    }
}
