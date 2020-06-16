//
//  View+ClearInteractable.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2020-03-18.
//

import SwiftUI

public extension View {

    /**
     This color can be used instead of `.clear`, which makes
     a view stop registering touches and gestures.
     */
    func withClearInteractableBackground() -> some View {
        background(Color.clearInteractable)
    }
}
