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
    
    @Published private(set) var action: KeyboardAction?
    @Published private(set) var buttonFrame: CGRect = .zero
    
    
    // MARK: - Functions
    
    open func reset() {
        action = nil
        buttonFrame = .zero
    }
    
    open func updateInput(for action: KeyboardAction?, geo: GeometryProxy) {
        self.action = action
        self.buttonFrame = geo.frame(in: .named(Self.coordinateSpace))
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
