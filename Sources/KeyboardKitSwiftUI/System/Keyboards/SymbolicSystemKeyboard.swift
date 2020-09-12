//
//  SymbolicSystemKeyboard.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2020-07-04.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI
import KeyboardKit

/**
 This view mimics a native, symbolic system keyboard.
 
 The keyboard supports three rows of input actions, a bottom
 row and an optional topmost view. The `inputSet` determines
 which input actions to show above the bottom bar.
 
 If provided, the optional `topmostView` will be added above
 the input rows. If you don't provide a `customBottomRow`, a
 `SystemKeyboardBottomRow.standard` row will be used instead,
 using a `.keyboardType(.alphabetic(.lowercased))` action as
 its leftmost action.
 
 `IMPORTANT` This view is not yet flexible enough to be used
 with most locales, since the actions surrounding the inputs
 cannot be modified. In the future, `inputSet` will probably
 be replaced by a more specific set of actions. 
 */
public struct SymbolicSystemKeyboard: View {
    
    public init(
        context: KeyboardContext,
        inputSet: SymbolicKeyboardInputSet,
        topmostView: AnyView? = nil,
        customBottomRow: SystemKeyboardBottomRow? = nil) {
        assert(inputSet.inputRows.count > 2, "inputSet must contain at least 3 rows")
        self.rows = KeyboardActionRows(characters: inputSet.inputRows)
        self.topmostView = topmostView
        self.bottomRow = customBottomRow ?? .standard(for: context, leftmostAction: .keyboardType(.alphabetic(.lowercased)))
    }
    
    private let rows: KeyboardActionRows
    private let topmostView: AnyView?
    private var bottomRow: SystemKeyboardBottomRow!

    @EnvironmentObject private var style: SystemKeyboardStyle
    
    public var body: some View {
        SystemKeyboardVStack {
            if topmostView != nil { topmostView! }
            SystemKeyboardButtonRow(actions: rows[0])
            SystemKeyboardButtonRow(actions: rows[1])
            HStack {
                SystemKeyboardButton(action: .keyboardType(.numeric)).frame(width: style.shiftWidth)
                SystemKeyboardButtonRow(actions: rows[2])
                SystemKeyboardButton(action: .backspace).frame(width: style.backspaceWidth)
            }
            bottomRow
        }
    }
}
