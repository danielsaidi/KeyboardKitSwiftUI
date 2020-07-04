//
//  NumericSystemKeyboard.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2020-07-04.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI
import KeyboardKit

/**
 This view mimics a numeric system keyboard, with three rows
 of input actions, a bottom bar and an optional topmost view.
 
 The view takes an `inputSet`, which determines which inputs
 the keyboard will have and an optional `topmostView`, which
 will be added as a topmost toolbar.
 
 `IMPORTANT` This is not flexible enough to be correct for a
 lot of countries, since I have just based it on English and
 Swedish keyboards. If it doesn't meet your needs, please do
 let me know how to make a more universally viable approach.
 */
public struct NumericSystemKeyboard: View {
    
    public init(
        inputSet: NumericKeyboardInputSet,
        topmostView: AnyView? = nil) {
        assert(inputSet.inputRows.count == 3, "inputSet must contain 3 rows")
        self.rows = KeyboardActionRows(characters: inputSet.inputRows)
        self.topmostView = topmostView
    }
    
    private let rows: KeyboardActionRows
    private let topmostView: AnyView?
    
    @EnvironmentObject private var style: SystemKeyboardStyle
    
    public var body: some View {
        SystemKeyboardVStack {
            if topmostView != nil { topmostView! }
            SystemKeyboardButtonRow(actions: rows[0])
            SystemKeyboardButtonRow(actions: rows[1])
            HStack {
                SystemKeyboardButton(action: .keyboardType(.symbolic)).frame(width: style.shiftWidth)
                SystemKeyboardButtonRow(actions: rows[2])
                SystemKeyboardButton(action: .backspace).frame(width: style.backspaceWidth)
            }
            SystemKeyboardBottomRow(leftmostAction: .keyboardType(.alphabetic(.lowercased)))
        }
    }
}
