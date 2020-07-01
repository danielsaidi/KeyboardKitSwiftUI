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
                expect(Image.backspace).toNot(beNil())
                expect(Image.command).toNot(beNil())
                expect(Image.control).toNot(beNil())
                expect(Image.dictation).toNot(beNil())
                expect(Image.emoji).toNot(beNil())
                expect(Image.globe).toNot(beNil())
                expect(Image.keyboard).toNot(beNil())
                expect(Image.keyboardDismiss).toNot(beNil())
                expect(Image.keyboardDismissLeft).toNot(beNil())
                expect(Image.keyboardDismissRight).toNot(beNil())
                expect(Image.moveCursorLeft).toNot(beNil())
                expect(Image.moveCursorRight).toNot(beNil())
                expect(Image.newLine).toNot(beNil())
                expect(Image.newLine).toNot(beNil())
                expect(Image.option).toNot(beNil())
                expect(Image.redo).toNot(beNil())
                expect(Image.shiftCapslocked).toNot(beNil())
                expect(Image.shiftLowercased).toNot(beNil())
                expect(Image.shiftUppercased).toNot(beNil())
                expect(Image.tab).toNot(beNil())
                expect(Image.undo).toNot(beNil())
            }
        }
    }
}
