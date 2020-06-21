//
//  KeyboardInputViewController+View.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2020-03-14.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI
import KeyboardKit

public extension KeyboardInputViewController {
    
    /**
     Remove all subviews then add a `SwiftUI` view that pins
     to the edges and resizes the extension to fit the view.
     
     When this function is called, the input vc will convert
     its `keyboardContext` to an `ObservableKeyboardContext`
     and provide thesame context to the provided view, as an
     `@EnvironmentObject` of type `ObservableKeyboardContext`.
     */
    func setup<Content: View>(with view: Content) {
        self.view.subviews.forEach { $0.removeFromSuperview() }
        let newContext = ObservableKeyboardContext(from: context)
        self.context = newContext
        let controller = KeyboardHostingController(rootView: view.environmentObject(newContext))
        controller.add(to: self)
    }
}
