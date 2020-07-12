//
//  View+KeyboardToast.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2020-02-20.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

public extension View {

    /**
     Present a centered toast over the view, using a custom
     `text` and `background`.
     */
    func keyboardToast<Background: View>(
        isActive: Binding<Bool>,
        text: String,
        background: Background,
        duration: TimeInterval = 2) -> some View {
        keyboardToast(
            isActive: isActive,
            content: Text(text).multilineTextAlignment(.center),
            background: background,
            duration: duration
        )
    }
    
    /**
     Present a centered toast over the view, using a custom
     `content` view and `background`.
     */
    func keyboardToast<Content: View, Background: View>(
        isActive: Binding<Bool>,
        content: Content,
        background: Background,
        duration: TimeInterval = 2) -> some View {
        KeyboardToast(
            isActive: isActive,
            content: content,
            background: background,
            duration: duration,
            presenter: { self }
        )
    }
}
