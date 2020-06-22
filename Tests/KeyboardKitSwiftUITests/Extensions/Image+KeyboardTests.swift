//
//  Image+KeyboardTests.swift
//  KeyboardKitTests
//
//  Created by Daniel Saidi on 2020-06-22.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import KeyboardKitSwiftUI
import SwiftUI

class Image_KeyboardTests: QuickSpec {

    override func spec() {
        
        describe("keayboard images") {
            
            it("are defined") {
                let images: [Image] = [.backspace, .globe, .newLine ]
                expect(images.count).to(equal(3))
            }
        }
    }
}
