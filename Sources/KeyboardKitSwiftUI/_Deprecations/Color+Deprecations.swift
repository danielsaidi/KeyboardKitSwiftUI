import KeyboardKit
import SwiftUI

public extension Color {
    
    @available(*, deprecated, renamed: "standardDarkButtonBackgroundColor")
    static func systemKeyboardButtonBackgroundColorDark(for context: KeyboardContext) -> Color {
        standardDarkButtonBackgroundColor(for: context)
    }
    
    @available(*, deprecated, renamed: "standardLightButtonBackgroundColor")
    static func systemKeyboardButtonBackgroundColorLight(for context: KeyboardContext) -> Color {
        standardLightButtonBackgroundColor(for: context)
    }
    
    @available(*, deprecated, renamed: "standardButtonForegroundColor")
    static func systemKeyboardButtonForegroundColor(for context: KeyboardContext) -> Color {
        standardButtonForegroundColor(for: context)
    }
    
    @available(*, deprecated, renamed: "standardButtonShadowColor")
    static func systemKeyboardButtonShadowColor(for context: KeyboardContext) -> Color {
        standardButtonShadowColor(for: context)
    }
}
