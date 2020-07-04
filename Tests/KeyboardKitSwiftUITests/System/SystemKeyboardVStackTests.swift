//
//  SystemKeyboardVStackTests.swift
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

class SystemKeyboardVStackTests: QuickSpec {

    override func spec() {
        
        describe("system keyboard vtack") {
            
            it("can be created with any view") {
                let stack = SystemKeyboardVStack { Text("Hello") }
                expect(stack).toNot(beNil())
            }
        }
    }
}
