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
 This context can be used to control `SecondaryInputCallout`
 callouts that appear as users long press a keyboard button.
 
 You should not use this contexst directly, but rather apply
 `.secondaryInputCallout` to any keyboard view (this is auto
 applied when you use a `SystemKeyboard`), then also apply a
 `.secondaryInputCalloutGesture` to any keyboard button that
 should trigger it (this is also auto applied when you use a
 `SystemKeyboardButton` or the standard gestures modifier).
 
 However, if you need to, you can override some parts of the
 implementation to customize it. However, the implementation
 has been designed to work like the native callout.
 
 `IMPORTANT` This is still an experimental feature, that may
 change a lot before it's stable. It can change in any minor
 release before 4.0.
 */
public class SecondaryInputCalloutContext: ObservableObject {
    
    
    // MARK: - Initialization
    
    public init(context: ObservableKeyboardContext) {
        self.context = context
    }
    
    
    // MARK: - Properties
    
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
    
    
    // MARK: - Functions
    
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
    
    open func triggerHapticFeedbackForSelectionChange() {
        HapticFeedback.selectionChanged.trigger()
    }
    
    open func update(actions: [KeyboardAction], geo: GeometryProxy, alignment: Alignment? = nil) {
        let coordinateSpace = Self.coordinateSpace
        self.buttonFrame = geo.frame(in: .named(coordinateSpace))
        self.alignment = alignment ?? getAlignment(for: geo)
        self.actions = isLeading ? actions : actions.reversed()
        self.selectedIndex = startIndex
    }
    
    open func updateSelection(with dragValue: DragGesture.Value?) {
        guard let value = dragValue, buttonFrame != .zero else { return }
        if shouldReset(for: value) { return resetSelection() }
        guard shouldUpdateSelection(with: value) else { return }
        let translation = value.translation.width
        let buttonWidth = buttonFrame.size.width
        let offset = Int(abs(translation) / buttonWidth)
        let index = isLeading ? offset : actions.count - offset - 1
        let currentIndex = self.selectedIndex
        let newIndex = isIndexWithinBounds(index) ? index : startIndex
        if currentIndex != newIndex { triggerHapticFeedbackForSelectionChange() }
        self.selectedIndex = newIndex
    }
}


// MARK: - Private functionality

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
