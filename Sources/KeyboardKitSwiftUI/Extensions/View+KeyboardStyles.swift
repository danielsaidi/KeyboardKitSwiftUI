//
//  View+KeyboardStyles.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2020-06-24.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import KeyboardKit
import SwiftUI

public extension View  {
    
    /**
     Apply the system font for the provided keyboard action.
     */
    func systemFont(for action: KeyboardAction) -> some View {
        self.font(Font(action.systemFont))
    }
    
    /**
     Apply a system keyboard button shadow to the view.
    */
    func systemKeyboardButtonShadow() -> some View {
        self.shadow(color: systemKeyboardButtonShadowColor, radius: 0, x: 0, y: 1)
    }
    
    /**
     Get the system keyboard button shadow color.
     */
    var systemKeyboardButtonShadowColor: Color {
        Color.black.opacity(0.3)
    }
}
