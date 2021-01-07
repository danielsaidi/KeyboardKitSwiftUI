//
//  SecondaryInputCalloutContext.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2021-01-06.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import KeyboardKit
import SwiftUI

/**
 This context can be used to control input callout views, to
 present the currently typed character.
 
 The context will automatically dismiss itself when the user
 hasn't typed anything for a short while.
 
 You can use `.shared` to get/set a shared context.
 
 You can inherit this class and override any `open` function
 to modify the callout behavior.
 
 `IMPORTANT` This is an experimental feature that could have
 breaking changes in any minor release before 4.0.
 */
open class InputCalloutContext: ObservableObject {
    
    
    // MARK: - Initialization
    
    public init() {}
    
    
    // MARK: - Properties
    
    public static var shared = InputCalloutContext()
    
    static let coordinateSpace = "com.keyboardkit.coordinate.InputCallout"
    
    public var input: String? { action?.input }
    public var isActive: Bool { input != nil }
    
    private var asyncTag = 0
    
    @Published private(set) var action: KeyboardAction?
    @Published private(set) var buttonFrame: CGRect = .zero
    
    
    // MARK: - Functions
    
    /**
     The visible button frame for the button view's geometry
     proxy. It should not include button inset nor shadow.
     */
    open func buttonFrame(for geo: GeometryProxy) -> CGRect {
        geo.frame(in: .named(Self.coordinateSpace)).insetBy(dx: 3, dy: 3)
    }
    
    /**
     Reset the context, which will reset all state and cause
     any callouts to dismiss.
     */
    open func reset() {
        action = nil
        buttonFrame = .zero
    }
    
    /**
     Update the current input for a certain keyboard action.
     */
    open func updateInput(for action: KeyboardAction?, geo: GeometryProxy) {
        self.action = action
        self.buttonFrame = self.buttonFrame(for: geo)
        tryReset(after: 0.5)
    }
}

private extension InputCalloutContext {
    
    func tryReset(after seconds: Double) {
        let tag = Int.random(in: 0...100_000)
        asyncTag = tag
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            guard tag == self.asyncTag else { return }
            self.reset()
        }
    }
}

private extension KeyboardAction {
    
    var input: String? {
        switch self {
        case .character(let char): return char
        default: return nil
        }
    }
}
