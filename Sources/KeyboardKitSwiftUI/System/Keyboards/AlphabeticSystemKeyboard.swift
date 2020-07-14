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
 state, an optional `topmostView` that will be added topmost,
 as well as an optional `customBottomRow`, that will replace
 the standard bottom row if provided.
 
 `IMPORTANT` This is not yet flexible enough to be used with
 a lot of countries, since the actions surrounding the input
 set actions can't be modified.
 */
public struct AlphabeticSystemKeyboard: View {
    
    public init(
        context: KeyboardContext,
        inputSet: AlphabeticKeyboardInputSet,
        state: KeyboardShiftState,
        topmostView: AnyView? = nil,
        customBottomRow: SystemKeyboardBottomRow? = nil) {
        assert(inputSet.inputRows.count > 2, "inputSet must contain at least rows")
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
