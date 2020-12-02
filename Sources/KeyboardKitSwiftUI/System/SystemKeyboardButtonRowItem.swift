//
//  SystemKeyboardButtonRowItem.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2020-12-02.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import KeyboardKit
import SwiftUI

/**
 This view is meant to be used within a `SystemKeyboard` and
 is the standard view that will be used if no custom view is
 provided when such a keyboard is created.
 
 This view wraps a `SystemKeyboardButton` and will adjust it
 to be used in a keyboard row. This involves applying height
 and paddings and new actions in a way that make the buttons
 in a keyboard appear to be separated, but be fully tappable.
 */
public struct SystemKeyboardButtonRowItem: View {
    
    public init(action: KeyboardAction) {
        self.action = action
    }
    
    private let action: KeyboardAction
    
    @EnvironmentObject var context: ObservableKeyboardContext
    @EnvironmentObject var style: SystemKeyboardStyle
    
    public var body: some View {
        SystemKeyboardButton(action: action, useModifiers: false)
            .frame(maxWidth: .infinity)
            .frame(height: style.buttonHeight - style.buttonInsets.top - style.buttonInsets.bottom)
            .systemKeyboardButtonStyle(for: action, context: context, style: style)
            .padding(style.buttonInsets)
            .frame(height: style.buttonHeight)
            .background(Color.clearInteractable)
            .keyboardAction(action, context: context)
    }
}
