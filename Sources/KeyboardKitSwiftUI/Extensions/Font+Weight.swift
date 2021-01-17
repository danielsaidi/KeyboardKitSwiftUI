//
//  Font+Weight.swift
//  
//
//  Created by Brennan Drew on 1/16/21.
//

import UIKit
import SwiftUI

public extension Font {
    func weight(_ uiFontWeight: UIFont.Weight?) -> Font {
        if let weight = uiFontWeight?.fontWeight() {
            return self.weight(weight)
        } else {
            return self
        }
    }
}

private extension UIFont.Weight {
    func fontWeight() -> Font.Weight {
        switch self {
        case .black: return .black
        case .bold: return .bold
        case .heavy: return .heavy
        case .light: return .light
        case .medium: return .medium
        case .regular: return .regular
        case .semibold: return .semibold
        case .thin: return .thin
        case .ultraLight: return .ultraLight
        
        default: return .regular
        }
    }
}
