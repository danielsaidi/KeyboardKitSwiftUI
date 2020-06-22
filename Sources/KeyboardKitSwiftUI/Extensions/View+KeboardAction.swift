//
//  View+KeyboardAction.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2020-06-22.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import KeyboardKit
import SwiftUI

public extension View {
    
    /**
     Apply the system font for the provided keyboard action.
     */
    func systemFont(for action: KeyboardAction) -> some View {
        self.font(Font(action.systemFont))
    }
}
