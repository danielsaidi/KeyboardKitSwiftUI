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
 This view mimics a symbolic system keyboard with three rows
 of input actions, a bottom bar and an optional topmost view.
 
 The view takes an `inputSet`, which determines which inputs
 the keyboard will have, an optional `topmostView` that will
 be added topmost, as well as an optional `customBottomRow`,
 that will replace the standard bottom row if provided.
 
 `IMPORTANT` This is not yet flexible enough to be used with
 a lot of countries, since the actions surrounding the input
 set actions can't be modified.
 */
public struct SymbolicSystemKeyboard: View {
    
    public init(
        context: KeyboardContext,
        inputSet: SymbolicKeyboardInputSet,
        topmostView: AnyView? = nil,
        customBottomRow: SystemKeyboardBottomRow? = nil) {
        assert(inputSet.inputRows.count > 2, "inputSet must contain at least rows")
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
