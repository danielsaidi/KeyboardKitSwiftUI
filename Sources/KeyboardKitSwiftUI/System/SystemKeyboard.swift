//
//  SystemKeyboard.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2020-12-02.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import KeyboardKit
import SwiftUI

/**
 This view mimics native system keyboards, like the standard
 alphabetic, numeric and symbolic keyboards.
 
 You can provide the keyboard with any `KeyboardLayout`. The
 leyboard will then present the layout rows in separate rows `SystemKeyboardButtonRow`
 aim to present the actions as closely as
 possible to how they would appear in a native keyboard. Any
 styling is done in `SystemKeyboardButtonRow` and any nested
 views it may use.
 */
public struct SystemKeyboard: View {
    
    public init(layout: KeyboardLayout) {
        self.rows = layout.actionRows
    }
    
    private let rows: KeyboardActionRows
    
    public var body: some View {
        SystemKeyboardVStack {
            ForEach(rows.enumerated().map { $0 }, id: \.offset) {
                row(at: $0.offset, actions: $0.element)
            }
        }
    }
}

private extension SystemKeyboard {
    
    func row(at index: Int, actions: KeyboardActionRow) -> some View {
        HStack {
            if index == 1 {
                Spacer(minLength: secondRowPadding)
            }
            SystemKeyboardButtonRow(actions: actions)
            if index == 1 {
                Spacer(minLength: secondRowPadding)
            }
        }
    }
    
    /**
     A temp. way to get side padding on each side on English
     iPhone keyboards.
     */
    var secondRowPadding: CGFloat {
        guard Locale.current.identifier.starts(with: "en") else { return 0 }
        return max(0, 20 * CGFloat(rows[0].count - rows[1].count))
    }
}
