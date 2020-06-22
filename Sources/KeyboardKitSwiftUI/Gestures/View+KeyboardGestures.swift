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
 This view wraps another view then applies keyboard-specific
 gestures to the view. It can be applied to a view using the
 `keyboardGestures` view modifier above.
 
 I first tried to implement this as a view modifier, but the
 timer that is currently needed by the repeating gesture did
 not trigger when this was a view modifier. I have thus made
 the view internal since I may want to change implementation
 later, as SwiftUI evolves.
 
 The gestures are currently implemented in a way that appear
 strange at first, but gives the best result. The first long
 press updates the `isRepeatGestureActive` property and also
 triggers the tap event. This works much better than to have
 a single tap gesture a double tap action since I found them
 to collide. The second long press gesture is triggering the
 long press action and also enables the repeat gesture timer,
 while the last tap event is sequenced last and disables the
 repeat gesture timer. It is confusing, but can hopefully be
 improved later on without affecting te external api.
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
    
    @GestureState private var isRepeatGestureActive = false
    @State private var isRepeatPressActive = false
    
    private let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        view
            .onReceive(timer) { _ in self.handleRepeatPress() }
            .gesture(
                LongPressGesture(minimumDuration: Double(Int.max))
                    .updating($isRepeatGestureActive) { state, _, _ in self.handleTap() }
                    .simultaneously(with: LongPressGesture().onEnded { _ in self.handleLongPress() })
                    .simultaneously(with: TapGesture(count: 2).onEnded { self.handleDoubleTap() })
                    .sequenced(before: TapGesture().onEnded { self.isRepeatPressActive = false })
        )
    }
}

private extension KeyboardGestures {
    
    func handleDoubleTap() {
        doubleTapAction?()
    }
    
    func handleLongPress() {
        self.isRepeatPressActive = true
        longPressAction?()
    }
    
    func handleRepeatPress() {
        guard isRepeatPressActive else { return }
        repeatAction?()
    }
    
    func handleTap() {
        tapAction?()
    }
}
