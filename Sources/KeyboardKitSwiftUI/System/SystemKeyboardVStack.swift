//
//  SystemKeyboardVStack.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2020-07-04.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI
import KeyboardKit

/**
 This stack wraps another view that mimics a system keyboard
 in a `VStack` and applies the correct padding for the style.
 */
public struct SystemKeyboardVStack<Content: View>: View {
    
    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    private let content: Content
    
    @EnvironmentObject private var style: SystemKeyboardStyle
    
    public var body: some View {
        VStack(spacing: style.rowSpacing) {
            content
        }.padding(style.padding)
    }
}
