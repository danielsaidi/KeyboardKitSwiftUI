//
//  StandardKeyboardDimensions.swift
//  KeyboardKit  
//
//  Created by Daniel Saidi on 2020-07-04.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import CoreGraphics
import Combine
import SwiftUI
import KeyboardKit

/**
 This is a standard implementation of `KeyboardDimensions`.
 
 This is a best effort, which may not work for some contexts,
 devices, orientations, locales etc. You can inherit it then
 provide any custom width information you need.
 
 `IMPORTANT` The feature is currently experimental and still
 under development. For now, it returns the layout that will
 fit iPhones with FaceID. Once the concept is proven to work,
 it should be extended for pther devices, languages etc.
 */
open class StandardKeyboardDimensions: KeyboardDimensions {
    
    public init(
        buttonHeight: CGFloat = .standardKeyboardRowHeight(),
        buttonInsets: EdgeInsets = .insets(from: .standardKeyboardRowItemInsets()),
        longButtonWidth: CGFloat = 100.0,
        shortButtonWidth: CGFloat = 50.0) {
        self.buttonHeight = buttonHeight
        self.buttonInsets = buttonInsets
        self.longButtonWidth = longButtonWidth
        self.shortButtonWidth = shortButtonWidth
    }
    
    public let buttonHeight: CGFloat
    public let buttonInsets: EdgeInsets
    
    public func width(for action: KeyboardAction, at row: Int, rowItemCount: Int, rowItemIndex: Int, context: KeyboardContext) -> KeyboardButtonWidth {
        let isLastItem = rowItemIndex == rowItemCount - 1
        switch action {
        case .none: return .available
        case .backspace: return standardShortControlButton
        case .character: return row == 0 ? .reference(.available) : .fromReference
        case .control: return .available // standardShortControlButton
        case .command: return .available // standardShortControlButton
        case .custom: return .available
        case .done: return .available // standardLongControlButton
        case .dictation: return .fromReference
        case .dismissKeyboard: return .available // standardMediumControlButton
        case .emoji: return standardShortControlButton
        case .emojiCategory: return standardShortControlButton
        case .escape: return .available // standardShortControlButton
        case .function: return .available // standardShortControlButton
        case .image: return .fromReference
        case .keyboardType: return standardShortControlButton
        case .moveCursorBackward: return .available // standardShortControlButton
        case .moveCursorForward: return .available // standardShortControlButton
        case .newLine: return .available // standardLongControlButton
        case .nextKeyboard: return standardShortControlButton
        case .option: return .available // standardShortControlButton
        case .search: return .available // standardMediumControlButton
        case .shift: return .available // standardShortControlButton
        case .systemImage: return .available
        case .space: return .available
        case .tab: return .available // standardLongControlButton
        }
    }
    
    
    
    
    @available(*, deprecated, message: "Use the new keyboard button width provider instead.")
    public let longButtonWidth: CGFloat
    
    
    @available(*, deprecated, message: "Use the new keyboard button width provider instead.")
    public let shortButtonWidth: CGFloat
    
    @available(*, deprecated, message: "Use the new keyboard button width provider instead.")
    public func width(
        for action: KeyboardAction,
        keyboardWidth: CGFloat,
        context: KeyboardContext) -> CGFloat? {
        switch action {
        case .shift, .backspace: return shortButtonWidth
        case .space: return keyboardWidth * 0.5
        case .nextKeyboard: return shortButtonWidth
        case .keyboardType(let type): return widthKeyboardType(switchingTo: type, context: context)
        default: return nil
        }
    }
    
    @available(*, deprecated, message: "Use the new keyboard button width provider instead.")
    func widthKeyboardType(switchingTo: KeyboardType, context: KeyboardContext) -> CGFloat? {
        let currentType = context.keyboardType
        let alphWidth: CGFloat? = context.needsInputModeSwitchKey ? shortButtonWidth : nil
        
        switch switchingTo {
        case .numeric:
            switch currentType {
            case .symbolic: return shortButtonWidth
            case .alphabetic: return alphWidth
            default: return nil
            }
        case .symbolic:
            switch currentType {
            case .numeric: return shortButtonWidth
            default: return nil
            }
        case .alphabetic: return alphWidth
        default: return nil
        }
    }
}

private extension StandardKeyboardDimensions {
    
    var standardLongControlButton: KeyboardButtonWidth { .percentage(0.25) }
    var standardMediumControlButton: KeyboardButtonWidth { .percentage(0.2) }
    var standardShortControlButton: KeyboardButtonWidth { .percentage(0.125) }
}

private extension KeyboardContext {
    
    var isPad: Bool { device.userInterfaceIdiom == .pad }
    var isPhone: Bool { device.userInterfaceIdiom == .phone }
    var isLandscape: Bool { deviceOrientation.isLandscape }
}
