//
//  SystemKeyboardBottomRowTests.swift
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

class SystemKeyboardBottomRowTests: QuickSpec {

    override func spec() {

        var context: MockKeyboardContext!
        
        beforeEach {
            context = MockKeyboardContext()
        }
        
        describe("standard bottom row") {
            
            it("applies the provided left action") {
                let row = SystemKeyboardBottomRow.standard(for: context, leftmostAction: .command)
                let actions = row.actions
                expect(actions).to(equal([.command, .keyboardType(.emojis), .space, .newLine]))
            }
            
            it("applies right action if one is provided") {
                let actions = SystemKeyboardBottomRow.standardLeftmostActions(for: context, leftAction: .control, rightAction: .command)
                expect(actions).to(equal([.control, .command]))
            }
            
            it("replaces right action if context needs input mode switch key") {
                context.needsInputModeSwitchKey = true
                let actions = SystemKeyboardBottomRow.standardLeftmostActions(for: context, leftAction: .dictation, rightAction: .command)
                expect(actions).to(equal([.dictation, .nextKeyboard]))
            }
        }
        
        describe("system keyboard bottom row") {
            
            it("generates the correct action collection") {
                let row = SystemKeyboardBottomRow(
                    leftmostActions: [.backspace],
                    rightmostActions: [.command])
                expect(row.actions).to(equal([.backspace, .space, .command]))
            }
            
            it("can be created with the default button builder") {
                let row = SystemKeyboardBottomRow(leftmostActions: [], rightmostActions: [])
                expect(row).toNot(beNil())
            }
            
            it("can be created with a custom button builder") {
                let row = SystemKeyboardBottomRow(leftmostActions: [], rightmostActions: []) { _ in AnyView(Text("HEJ")) }
                expect(row).toNot(beNil())
            }
        }
        
        describe("standard button builder") {
            
            it("returns a view") {
                let builder = SystemKeyboardBottomRow.standardButtonBuilder()
                let result = builder(.backspace)
                expect(result).toNot(beNil())
            }
        }
        
        describe("standard leftmost actions") {
            
            it("applies the default right action if none is provided") {
                let actions = SystemKeyboardBottomRow.standardLeftmostActions(for: context, leftAction: .backspace)
                expect(actions).to(equal([.backspace, .keyboardType(.emojis)]))
            }
            
            it("applies right action if one is provided") {
                let actions = SystemKeyboardBottomRow.standardLeftmostActions(for: context, leftAction: .control, rightAction: .command)
                expect(actions).to(equal([.control, .command]))
            }
            
            it("replaces right action if context needs input mode switch key") {
                context.needsInputModeSwitchKey = true
                let actions = SystemKeyboardBottomRow.standardLeftmostActions(for: context, leftAction: .dictation, rightAction: .command)
                expect(actions).to(equal([.dictation, .nextKeyboard]))
            }
        }
        
        describe("standard rightmost actions") {
            
            beforeEach {
                context.needsInputModeSwitchKey = true
            }
            
            it("applies the default actions if none is provided") {
                let actions = SystemKeyboardBottomRow.standardRightmostActions(for: context)
                expect(actions).to(equal([.character("."), .newLine]))
            }
            
            it("applies left action if one is provided") {
                let actions = SystemKeyboardBottomRow.standardRightmostActions(for: context, leftAction: .control)
                expect(actions).to(equal([.control, .newLine]))
            }
            
            it("applies right action if one is provided") {
                let actions = SystemKeyboardBottomRow.standardRightmostActions(for: context, rightAction: .command)
                expect(actions).to(equal([.character("."), .command]))
            }
            
            it("ignores left action if context does not need input mode switch key") {
                context.needsInputModeSwitchKey = false
                let actions = SystemKeyboardBottomRow.standardRightmostActions(for: context, rightAction: .command)
                expect(actions).to(equal([.command]))
            }
        }
    }
}
