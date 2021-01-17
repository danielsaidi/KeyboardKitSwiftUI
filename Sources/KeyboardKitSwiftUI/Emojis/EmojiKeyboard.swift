//
//  EmojiKeyboard.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2021-01-17.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import KeyboardKit
import SwiftUI

/**
 This view can be used to list an emoji collection using the
 provided configuration.
 
 You can customize the buttons in the grid by using a custom
 `buttonBuilder` in the initalizer. If you do not, init will
 use the static `standardButton` function. When you create a
 custom button, you can still make use of the `standardText`
 function to get a raw emoji text view.
 
 `TODO` This can't be previewed when it depends on a context.
 For some reason, the preview engine then crashes. Return to
 it after 4.0 to see if a cleaned up context solves this.
 */
@available(iOS 14.0, *)
public struct EmojiKeyboard: View {
    
    public init(
        emojis: [Emoji],
        configuration: EmojiKeyboardConfiguration = .standardPhonePortrait,
        buttonBuilder: @escaping ButtonBuilder = Self.standardButton) {
        let item = GridItem(.fixed(configuration.itemSize), spacing: configuration.verticalSpacing - 9)
        self.configuration = configuration
        self.emojis = emojis.map { EmojiKeyboardItem(emoji: $0) }
        self.rows = Array(repeating: item, count: configuration.rows)
        self.buttonBuilder = buttonBuilder
    }
    
    public typealias ButtonBuilder = (Emoji, KeyboardContext) -> AnyView
    
    struct EmojiKeyboardItem: Identifiable {
        let id = UUID()
        let emoji: Emoji
    }
    
    private let buttonBuilder: ButtonBuilder
    private let configuration: EmojiKeyboardConfiguration
    private let emojis: [EmojiKeyboardItem]
    private let rows: [GridItem]
    private var totalHeight: CGFloat { CGFloat(rows.count) * configuration.itemSize }
    
    @EnvironmentObject var context: ObservableKeyboardContext
    
    public var body: some View {
        LazyHGrid(rows: rows, spacing: configuration.horizontalSpacing) {
            ForEach(emojis) {
                buttonBuilder($0.emoji, context)
            }
        }
        .frame(height: totalHeight)
    }
    
    /**
     This standard button builder will return an button that
     applies the keyboard actions of an `.emoji` action.
     */
    public static func standardButton(for emoji: Emoji, context: KeyboardContext) -> AnyView {
        AnyView(standardText(for: emoji)
            .keyboardAction(.emoji(emoji.char), actionHandler: context.actionHandler))
    }
    
    /**
     This standard button builder will return an button that
     applies the keyboard actions of an `.emoji` action.
     */
    public static func standardText(for emoji: Emoji) -> some View {
        Text(emoji.char)
            .font(.system(size: 500))
            .minimumScaleFactor(0.01)
    }
}

//@available(iOS 14.0, *)
//struct EmojiKeyboard_Previews: PreviewProvider {
//    static var previews: some View {
//        ScrollView(.horizontal) {
//            EmojiKeyboard(emojis: Array(Emoji.all.prefix(50)))
//        }
//    }
//}
