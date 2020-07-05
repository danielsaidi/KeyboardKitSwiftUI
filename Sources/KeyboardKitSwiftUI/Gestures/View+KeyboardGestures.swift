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
        tapAction: KeyboardGestureAction? = nil,
        doubleTapAction: KeyboardGestureAction? = nil,
        longPressAction: KeyboardGestureAction? = nil,
        repeatAction: KeyboardGestureAction? = nil) -> some View {
        KeyboardGestures(
            view: self,
            tapAction: tapAction,
            doubleTapAction: doubleTapAction,
            longPressAction: longPressAction,
            repeatAction: repeatAction)
    }
}


/**
 This is a shared timer for all repeat gestures.
 */
private class KeyboardGestureTimer {
    
    static let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
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
        tapAction: KeyboardGestureAction? = nil,
        doubleTapAction: KeyboardGestureAction? = nil,
        longPressAction: KeyboardGestureAction? = nil,
        repeatAction: KeyboardGestureAction? = nil) {
        self.view = view
        self.tapAction = tapAction
        self.doubleTapAction = doubleTapAction
        self.longPressAction = longPressAction
        self.repeatAction = repeatAction
    }
    
    let view: Content
    let tapAction: KeyboardGestureAction?
    let doubleTapAction: KeyboardGestureAction?
    let longPressAction: KeyboardGestureAction?
    let repeatAction: KeyboardGestureAction?
    
    @State private var isRepeatPressActive = false
    
    var body: some View {
        view.onReceive(KeyboardGestureTimer.timer) { _ in self.handleRepeatPress() }
            .gesture(TapGesture().onEnded(handleTap))
            .simultaneousGesture(
                TapGesture(count: 2).onEnded(handleDoubleTap))
            .simultaneousGesture(
                LongPressGesture().onEnded { _ in self.handleLongPress() })
            .simultaneousGesture(
                LongPressGesture(minimumDuration: 1)
                    .onEnded { _ in self.beginRepeatGesture() })
            .simultaneousGesture(
                DragGesture(minimumDistance: 0)
                    .onEnded { _ in self.endRepeatGesture() })
    }
}

private extension KeyboardGestures {
    
    func beginRepeatGesture() {
        isRepeatPressActive = true
    }
    
    func endRepeatGesture() {
        isRepeatPressActive = false
    }
    
    func handleDoubleTap() {
        doubleTapAction?()
    }
    
    func handleLongPress() {
        longPressAction?()
    }
    
    func handleTap() {
        isRepeatPressActive = false
        tapAction?()
    }
    
    func handleRepeatPress() {
        guard isRepeatPressActive else { return }
        repeatAction?()
    }
}
