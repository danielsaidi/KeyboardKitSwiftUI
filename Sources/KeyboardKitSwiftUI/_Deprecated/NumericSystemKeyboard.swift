//
//  NumericSystemKeyboard.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2020-07-04.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI
import KeyboardKit

@available(*, deprecated, message: "Use SystemKeyboard with a keyboard layout instead")
public struct NumericSystemKeyboard: View {
    
    public init(
        context: KeyboardContext,
        inputSet: NumericKeyboardInputSet,
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
                SystemKeyboardButton(action: .keyboardType(.symbolic)).frame(width: style.shiftWidth)
                SystemKeyboardButtonRow(actions: rows[2])
                SystemKeyboardButton(action: .backspace).frame(width: style.backspaceWidth)
            }
            bottomRow
        }
    }
}
