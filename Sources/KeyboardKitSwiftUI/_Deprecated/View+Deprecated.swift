import SwiftUI

public extension View {
    
    @available(*, deprecated, message: "This modifier is no longer used by KeyboardKit and will be removed in 4.0.")
    func systemKeyboardButtonFrame(for style: SystemKeyboardStyle)  -> some View {
        self.frame(maxWidth: .infinity)
            .frame(height: style.buttonHeight)
    }
}
