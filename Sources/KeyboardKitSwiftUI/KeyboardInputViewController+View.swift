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
    
    /**
     Call this function to make this extension automatically
     resize the keyboard view when the keyboard type changes.
     You must provide a block that returns the keyboard, and
     a store where the keyboard type publisher's cancellable
     will be stored.
     
     `NOTE` This is quite clunky now, since the main library
     doesn't target iOS 13, which means that it cannot refer
     to SwiftUI or Combine and therefore cannot have a store
     for observables in the view controller base class. This
     will be improved in KK 4.0, when the two libraries will
     merge and the deployment target will be raised to 13.
     */
    func setupAutoResizing<KeyboardView: View, ObservableStore>(
        for view: @escaping @autoclosure () -> KeyboardView,
        storeObservableIn store: inout ObservableStore)
    where ObservableStore: RangeReplaceableCollection, ObservableStore.Element == AnyCancellable {
        guard let context = context as? ObservableKeyboardContext else { return }
        context.$keyboardType
            .sink { _ in self.setup(with: view()) }
            .store(in: &store)
    }
}
