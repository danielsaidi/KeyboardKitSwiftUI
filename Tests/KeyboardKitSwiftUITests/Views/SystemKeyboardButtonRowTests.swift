//
//  SystemKeyboardButtonRowTestss.swift
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
        
        describe("action collection") {
            
            it("is correctly setup when context needs input mode switch key") {
                let context = MockKeyboardContext()
                context.needsInputModeSwitchKey = true
                let row = SystemKeyboardBottomRow(leftmostAction: .control) { _ in fatalError() }
                let actions = row.actions(for: context)
                expect(actions).to(equal([
                    .control,
                    .nextKeyboard,
                    .space,
                    .keyboardType(.emojis),
                    .newLine
                ]))
            }
            
            it("is correctly setup when context doesn't need input mode switch key") {
                let context = MockKeyboardContext()
                context.needsInputModeSwitchKey = false
                let row = SystemKeyboardBottomRow(leftmostAction: .escape) { _ in fatalError() }
                let actions = row.actions(for: context)
                expect(actions).to(equal([
                    .escape,
                    .keyboardType(.emojis),
                    .space,
                    .keyboardType(.images),
                    .newLine
                ]))
            }
        }
        
        describe("view collection") {
            
            it("is correctly setup when context needs input mode switch key") {
                let context = MockKeyboardContext()
                context.needsInputModeSwitchKey = true
                let row = SystemKeyboardBottomRow(leftmostAction: .control) { _ in fatalError() }
                let actions = row.actions(for: context)
                let views = row.actions(for: context)
                expect(views.count).to(equal(actions.count))
            }
            
            it("is correctly setup when context doesn't need input mode switch key") {
                let context = MockKeyboardContext()
                context.needsInputModeSwitchKey = false
                let row = SystemKeyboardBottomRow(leftmostAction: .escape) { _ in fatalError() }
                let actions = row.actions(for: context)
                let views = row.actions(for: context)
                expect(views.count).to(equal(actions.count))
            }
        }
    }
}
