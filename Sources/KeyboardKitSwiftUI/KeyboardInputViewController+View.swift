//
//  KeyboardInputViewController+View.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2020-03-14.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Combine
import KeyboardKit
import SwiftUI

public extension KeyboardInputViewController {
    
    /**
     Remove all subviews then add a `SwiftUI` view that pins
     to the edges and resizes the extension to fit that view.
     
     When this function is called, the input view controller
     will convert its current `keyboardContext` object to an
     `ObservableKeyboardContext` then provide it to the view
     as an `@EnvironmentObject`.
     */
    func setup<Content: View>(with view: Content) {
        self.view.subviews.forEach { $0.removeFromSuperview() }
        let newContext = ObservableKeyboardContext(from: context)
        self.context = newContext
        let view = view.environmentObject(newContext)
        let controller = KeyboardHostingController(rootView: view)
        controller.add(to: self)
    }
}
