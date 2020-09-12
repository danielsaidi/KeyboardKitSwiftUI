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
 This view mimics a native, alphabetic system keyboard.
 
 The keyboard supports three rows of input actions, a bottom
 row and an optional topmost view. The `inputSet` determines
 which input actions to show above the bottom bar.
 
 If provided, the optional `topmostView` will be added above
 the input rows. If you don't provide a `customBottomRow`, a
 `SystemKeyboardBottomRow.standard` row will be used instead,
 using a `.keyboardType(.numeric)` leftmost action.
 
 `IMPORTANT` This view is not yet flexible enough to be used
 with most locales, since the actions surrounding the inputs
 cannot be modified. In the future, `inputSet` will probably
 be replaced by a more specific set of actions.
 */
public struct AlphabeticSystemKeyboard: View {
    
    public init(
        context: KeyboardContext,
        inputSet: AlphabeticKeyboardInputSet,
        state: KeyboardShiftState,
        topmostView: AnyView? = nil,
        customBottomRow: SystemKeyboardBottomRow? = nil) {
        assert(inputSet.inputRows.count > 2, "inputSet must contain at least 3 rows")
        let inputRows = inputSet.inputRows
        let chars = state.isUppercased ? inputRows.uppercased() : inputRows
        self.rows = KeyboardActionRows(characters: chars)
        self.secondRowPadding = max(0, 20 * CGFloat(inputRows[0].count - inputRows[1].count))
        self.state = state
        self.topmostView = topmostView
        self.bottomRow = customBottomRow ?? .standard(for: context, leftmostAction: .keyboardType(.numeric))
    }
    
    private let rows: KeyboardActionRows
    private let state: KeyboardShiftState
    private let secondRowPadding: CGFloat
    private let topmostView: AnyView?
    private var bottomRow: SystemKeyboardBottomRow!
    
    @EnvironmentObject private var style: SystemKeyboardStyle
    
    public var body: some View {
        SystemKeyboardVStack {
            if topmostView != nil { topmostView! }
            SystemKeyboardButtonRow(actions: rows[0])
            HStack {
                Spacer(minLength: secondRowPadding)
                SystemKeyboardButtonRow(actions: rows[1])
                Spacer(minLength: secondRowPadding)
            }
            HStack {
                SystemKeyboardButton(action: .shift(currentState: state)).frame(width: style.shiftWidth)
                SystemKeyboardButtonRow(actions: rows[2])
                SystemKeyboardButton(action: .backspace).frame(width: style.backspaceWidth)
            }
            bottomRow
        }
    }
}
