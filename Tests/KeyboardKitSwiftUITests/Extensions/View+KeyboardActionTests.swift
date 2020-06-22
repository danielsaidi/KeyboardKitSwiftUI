//
//  View+KeyboardActionTests.swift
//  KeyboardKitTests
//
//  Created by Daniel Saidi on 2020-06-22.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import KeyboardKitSwiftUI
import SwiftUI

class View_KeyboardActionTests: QuickSpec {

    override func spec() {
        
        describe("system font for action") {
            
            it("is defined") {
                let font = Text("").systemFont(for: .backspace)
                expect(font).toNot(beNil())
            }
        }
    }
}
