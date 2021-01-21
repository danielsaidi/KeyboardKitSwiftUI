//
//  KeyboardDimensions.swift
//  KeyboardKit
//
//  Created by Brennan Drew on 2021-01-19.
//

import CoreGraphics
import Combine
import SwiftUI
import KeyboardKit

/**
 This struct specifies dimensions for a keyboard.
 */
public protocol KeyboardDimensions {
    
    var buttonHeight: CGFloat { get }
    var buttonInsets: EdgeInsets { get }
    
    
    @available(*, deprecated, message: "Use the new KeyboardButtonWidth-based width function instead.")
    var longButtonWidth: CGFloat { get }
    
    @available(*, deprecated, message: "Use the new KeyboardButtonWidth-based width function instead.")
    var shortButtonWidth: CGFloat { get }
    
    @available(*, deprecated, message: "Use the new KeyboardButtonWidth-based width function instead.")
    func width(for action: KeyboardAction, keyboardWidth: CGFloat, context: KeyboardContext) -> CGFloat?
    
    func width(for action: KeyboardAction, at row: Int, rowItemCount: Int, rowItemIndex: Int, context: KeyboardContext) -> KeyboardButtonWidth
}
