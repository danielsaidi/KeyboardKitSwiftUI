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
 keyboard will then present the layout rows in separate rows,
 with a `SystemKeyboardButtonRow` for each row.
 */
public struct SystemKeyboard: View {
    
    public init(layout: KeyboardLayout) {
        self.rows = layout.actionRows
    }
    
    private let rows: KeyboardActionRows
    
    @EnvironmentObject private var style: SystemKeyboardStyle
    
    public var body: some View {
        VStack(spacing: 0) {
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
