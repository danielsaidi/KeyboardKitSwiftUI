//
//  AlphabeticSystemKeyboard.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2020-07-04.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI
import KeyboardKit

/**
 This view mimics an alphabetical system keyboard, which has
 three rows of input actions, one bottom bar and an optional
 topmost view.
 
 The view takes an `inputSet`, which determines which inputs
 the keyboard will have, a `state` that determines its shift
 state and an optional `topmostView` that will be added as a
 topmost toolbar.
 
 `IMPORTANT` This is not flexible enough to be correct for a
 lot of countries, since I have just based it on English and
 Swedish keyboards. If it doesn't meet your needs, please do
 let me know how to make a more universally viable approach.
 */
public struct AlphabeticSystemKeyboard: View {
    
    public init(
        inputSet: AlphabeticKeyboardInputSet,
        state: KeyboardShiftState,
        topmostView: AnyView? = nil) {
        assert(inputSet.inputRows.count == 3, "inputSet must contain 3 rows")
        let inputRows = inputSet.inputRows
        let chars = state.isUppercased ? inputRows.uppercased() : inputRows
        self.rows = KeyboardActionRows(characters: chars)
        self.secondRowPadding = max(0, 20 * CGFloat(inputRows[0].count - inputRows[1].count))
        self.state = state
        self.topmostView = topmostView
    }
    
    private let rows: KeyboardActionRows
    private let state: KeyboardShiftState
    private let secondRowPadding: CGFloat
    private let topmostView: AnyView?
    
    @EnvironmentObject private var style: SystemKeyboardStyle
    
    public var body: some View {
        SystemKeyboardVStack {
            if topmostView != nil { topmostView! }
            firstInputRow
            secondInputRow
            thirdInputRow
            bottomRow
        }
    }
}

private extension AlphabeticSystemKeyboard {
    
    var firstInputRow: some View {
        SystemKeyboardButtonRow(actions: rows[0])
    }
    
    var secondInputRow: some View {
        HStack {
            Spacer(minLength: secondRowPadding)
            SystemKeyboardButtonRow(actions: rows[1])
            Spacer(minLength: secondRowPadding)
        }
    }
    
    var thirdInputRow: some View {
        HStack {
            SystemKeyboardButton(action: .shift(currentState: state)).frame(width: style.shiftWidth)
            SystemKeyboardButtonRow(actions: rows[2])
            SystemKeyboardButton(action: .backspace).frame(width: style.backspaceWidth)
        }
    }
    
    var bottomRow: some View {
        SystemKeyboardBottomRow(leftmostAction: .keyboardType(.numeric))
    }
}
