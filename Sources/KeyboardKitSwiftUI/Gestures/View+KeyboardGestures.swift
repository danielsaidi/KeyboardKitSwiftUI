//
//  View+KeyboardGestures.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2020-06-21.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import KeyboardKit
import SwiftUI

public extension View {
    
    typealias KeyboardGestureAction = () -> Void
    
    /**
     Add keyboard-specific gesture actions to the view.
     
     This is the preferred way to apply keyboard gestures to
     a view. The resulting view is internal and not intended
     for public use.
     */
    func keyboardGestures(
        action: KeyboardAction? = nil,
        tapAction: KeyboardGestureAction? = nil,
        doubleTapAction: KeyboardGestureAction? = nil,
        longPressAction: KeyboardGestureAction? = nil,
        repeatAction: KeyboardGestureAction? = nil,
        inputCalloutContext: InputCalloutContext = .shared,
        secondaryInputCalloutContext: SecondaryInputCalloutContext = .shared) -> some View {
        KeyboardGestures(
            view: self,
            action: action,
            tapAction: tapAction,
            doubleTapAction: doubleTapAction,
            longPressAction: longPressAction,
            repeatAction: repeatAction,
            inputCalloutContext: inputCalloutContext,
            secondaryInputCalloutContext: secondaryInputCalloutContext)
    }
}

/**
 This view wraps a view then applies keyboard gestures to it.
 It can be applied with the `keyboardGestures` view modifier.
 
 I first tried implementing this as a view modifier, but the
 repeating gesture timer didn't trigger then. I thus made it
 an internal view, to make it possible to change it later.
 */
struct KeyboardGestures<Content: View>: View {
    
    init(
        view: Content,
        action: KeyboardAction?,
        tapAction: KeyboardGestureAction?,
        doubleTapAction: KeyboardGestureAction?,
        longPressAction: KeyboardGestureAction?,
        repeatAction: KeyboardGestureAction?,
        inputCalloutContext: InputCalloutContext,
        secondaryInputCalloutContext: SecondaryInputCalloutContext) {
        self.view = view
        self.action = action
        self.tapAction = tapAction
        self.doubleTapAction = doubleTapAction
        self.longPressAction = longPressAction
        self.repeatAction = repeatAction
        self.inputCalloutContext = inputCalloutContext
        self.secondaryInputCalloutContext = secondaryInputCalloutContext
    }
    
    private let view: Content
    private let action: KeyboardAction?
    private let tapAction: KeyboardGestureAction?
    private let doubleTapAction: KeyboardGestureAction?
    private let longPressAction: KeyboardGestureAction?
    private let repeatAction: KeyboardGestureAction?
    
    private let inputCalloutContext: InputCalloutContext
    private let secondaryInputCalloutContext: SecondaryInputCalloutContext
    
    @State private var isRepeatPressActive = false
    @State private var isInputCalloutEnabled = true
    
    private let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        view.overlay(GeometryReader { geo in
            Color.clearInteractable
                .onReceive(timer) { _ in self.handleRepeatPress() }
                .gesture(tapGesture)
                .simultaneousGesture(doubleTapGesture)
                .simultaneousGesture(longPressGesture)
                .simultaneousGesture(dragGesture(for: geo))
                .simultaneousGesture(secondaryInputCalloutGesture(for: geo))
        })
    }
}


// MARK: - Gestures

private extension KeyboardGestures {
    
    var doubleTapGesture: some Gesture {
        TapGesture(count: 2).onEnded {
            doubleTapAction?()
        }
    }
    
    func dragGesture(for geo: GeometryProxy) -> some Gesture {
        DragGesture(minimumDistance: 0)
            .onChanged { _ in
                tryShowInputCallout(for: geo) }
            .onEnded { _ in
                inputCalloutContext.reset()
                isRepeatPressActive = false }
    }
    
    var longPressGesture: some Gesture {
        LongPressGesture().onEnded { _ in
            self.longPressAction?()
            self.isRepeatPressActive = true }
    }
    
    func secondaryInputCalloutGesture(for geo: GeometryProxy) -> some Gesture {
        LongPressGesture()
            .onEnded { _ in
                inputCalloutContext.reset()
                isInputCalloutEnabled = false
                secondaryInputCalloutContext.updateInputs(for: action, geo: geo) }
            .sequenced(before: DragGesture(minimumDistance: 0))
            .onChanged {
                switch $0 {
                case .first: break
                case .second(_, let drag):
                    secondaryInputCalloutContext.updateSelection(with: drag)
                }
            }
            .onEnded { _ in
                isInputCalloutEnabled = true
                secondaryInputCalloutContext.endDragGesture() }
    }
    
    var tapGesture: some Gesture {
        TapGesture().onEnded {
            tapAction?()
            inputCalloutContext.reset()
        }
    }
}


// MARK: - Functions

private extension KeyboardGestures {
    
    func handleRepeatPress() {
        guard isRepeatPressActive else { return }
        repeatAction?()
    }
    
    func tryShowInputCallout(for geo: GeometryProxy) {
        guard isInputCalloutEnabled else { return }
        inputCalloutContext.updateInput(for: action, geo: geo)
    }
}
