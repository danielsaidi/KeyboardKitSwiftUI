//
//  Image+Keyboard.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2020-03-11.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

@available(iOS 13.0, *)
public extension Image {
    
    static var backspace: Image { Image(systemName: "delete.left") }
    static var globe: Image { Image(systemName: "globe") }
    static var newLine: Image { Image(systemName: "arrow.turn.down.left") }
    static var space: Image { Image(systemName: "arrow.right") }
}
