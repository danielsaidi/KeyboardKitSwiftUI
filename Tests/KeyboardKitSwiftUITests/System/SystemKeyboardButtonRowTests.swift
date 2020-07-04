//
//  SystemKeyboardButtonRowTests.swift
//  KeyboardKitTests
//
//  Created by Daniel Saidi on 2020-07-02.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Quick
import Nimble
import KeyboardKit
import SwiftUI
@testable import KeyboardKitSwiftUI

class SystemKeyboardButtonRowTests: QuickSpec {

    override func spec() {
        
        describe("system keyboard button row") {
            
            it("can be created with the default button builder") {
                let button = SystemKeyboardButtonRow(actions: [.command])
                expect(button).toNot(beNil())
            }
            
            it("can be created with a custom button builder") {
                let button = SystemKeyboardButtonRow(actions: [.command], buttonBuilder: { _ in AnyView(Text("HEJ")) })
                expect(button).toNot(beNil())
            }
        }
        
        describe("standard button builder") {
            
            it("returns a view") {
                let builder = SystemKeyboardButtonRow.standardButtonBuilder
                let result = builder(.backspace)
                expect(result).toNot(beNil())
            }
        }
    }
}
