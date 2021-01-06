//
//  SecondaryCalloutActionProvider.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2021-01-06.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import KeyboardKit
import SwiftUI

/**
 This context can be used to control secondary input callout
 bubbles that appears as users long press a keyboard button.
 
 You can override parts of this implementation when you need
 to customize it in any way. However, the implementation has
 been designed to work like the native callout.
 
 You should create a shared context instance and refer to it
 from both the callout view and the gestures that control it.
 Since this context is not yet added to the main repo (since
 it has no support for observable classes), `KeyboardContext`
 has a new, computed `secondaryInputCalloutContext` that you
 can use to get a correctly configured callout context.
 
 `IMPORTANT` This is still an experimental feature, that may
 change a lot before it's stable. It can change in any minor
 release before 4.0.
 */
public class SecondaryInputCalloutContext: ObservableObject {
    
    public init(context: ObservableKeyboardContext) {
        self.context = context
    }
    
    private let context: ObservableKeyboardContext
    
    @Published private(set) var actions: [KeyboardAction] = []
    @Published private(set) var alignment: Alignment = .leading
    @Published private(set) var buttonFrame: CGRect = .zero
    @Published private(set) var selectedIndex: Int = -1
    
    public static let coordinateSpace = "com.keyboardkit.coordinate.SecondaryInputCallout"
 
    public var isActive: Bool { actions.isEmpty }
    public var isLeading: Bool { !isTrailing }
    public var isTrailing: Bool { alignment.horizontal == .trailing }
    
    public var selectedAction: KeyboardAction? {
        isIndexWithinBounds(selectedIndex) ? actions[selectedIndex] : nil
    }
    
    open func endDragGesture() {
        handleSelectedAction()
        resetSelection()
    }
    
    open func handleSelectedAction() {
        guard let action = selectedAction else { return }
        context.actionHandler.handle(.tap, on: action, sender: nil)
    }
    
    open func resetSelection() {
        actions = []
        selectedIndex = -1
        buttonFrame = .zero
    }
    
    func update(actions: [KeyboardAction], geo: GeometryProxy, alignment: Alignment? = nil) {
        let coordinateSpace = Self.coordinateSpace
        self.buttonFrame = geo.frame(in: .named(coordinateSpace))
        self.alignment = alignment ?? getAlignment(for: geo)
        self.actions = isLeading ? actions : actions.reversed()
        self.selectedIndex = startIndex
    }
    
    func updateSelection(with dragValue: DragGesture.Value?) {
        guard let value = dragValue, buttonFrame != .zero else { return }
        if shouldReset(for: value) { return resetSelection() }
        guard shouldUpdateSelection(with: value) else { return }
        // TODO: Trigger haptic feedback
        let translation = value.translation.width
        let buttonWidth = buttonFrame.size.width
        let offset = Int(abs(translation) / buttonWidth)
        let index = isLeading ? offset : actions.count - offset - 1
        self.selectedIndex = isIndexWithinBounds(index) ? index : startIndex
    }
}

private extension SecondaryInputCalloutContext {
    
    var startIndex: Int {
        isLeading ? 0 : actions.count - 1
    }
    
    func isIndexWithinBounds(_ index: Int) -> Bool {
        index >= 0 && index < actions.count
    }
    
    func getAlignment(for geo: GeometryProxy) -> Alignment {
        let center = UIScreen.main.bounds.size.width / 2
        let isTrailing = buttonFrame.origin.x > center
        return isTrailing ? .trailing : .leading
    }
    
    func shouldReset(for dragValue: DragGesture.Value) -> Bool {
        dragValue.translation.height > buttonFrame.height
    }
    
    func shouldUpdateSelection(with dragValue: DragGesture.Value) -> Bool {
        let translation = dragValue.translation.width
        if translation == 0 { return true }
        return isLeading ? translation > 0 : translation < 0
    }
}
