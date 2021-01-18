//
//  EmojiCategoryKeyboard.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2021-01-17.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import KeyboardKit
import SwiftUI

/**
 This view lists all emojis from a selected category as well
 as a menu that lets the user select a new category.
 
 `TODO` The view should list a collection of emoji keyboards
 in an `HStack`, one for each category. However, I can't get
 it to scroll correctly.
 
 `TODO` This can't be previewed when it depends on a context.
 For some reason, the preview engine then crashes. Return to
 it after 4.0 to see if a cleaned up context solves this.
 */
@available(iOS 14.0, *)
public struct EmojiCategoryKeyboard: View {
    
    public init(
        categories: [EmojiCategory] = EmojiCategory.all,
        selection: EmojiCategory? = nil,
        configuration: EmojiKeyboardConfiguration = .standardPhonePortrait) {
        self.categories = categories.filter { $0.emojis.count > 0 }
        self.configuration = configuration
        self.initialSelection = selection
    }
    
    @State private var isInitialized = false
    @State private var selection = EmojiCategory.smileys
    
    private let initialSelection: EmojiCategory?
    private let categories: [EmojiCategory]
    private let configuration: EmojiKeyboardConfiguration
    
    public var body: some View {
        VStack {
            ScrollView(.horizontal) {
                EmojiKeyboard(
                    emojis: selection.emojis.map { Emoji(char: $0) },
                    configuration: configuration).padding(.horizontal)
            }
            EmojiCategoryKeyboardMenu(categories: categories, selection: $selection)
        }
        .onAppear(perform: initialize)
        .onDisappear(perform: saveCurrentCategory)
    }
}

@available(iOS 14.0, *)
private extension EmojiCategoryKeyboard {
    
    var defaults: UserDefaults { .standard }
    var defaultsKey: String { "com.keyboardkit.EmojiCategoryKeyboard.category" }
    
    var persistedCategory: EmojiCategory {
        let name = defaults.string(forKey: defaultsKey) ?? ""
        return categories.first { $0.rawValue == name } ?? .smileys
    }
    
    func initialize() {
        if isInitialized { return }
        selection = initialSelection ?? persistedCategory
        isInitialized = true
    }
    
    func saveCurrentCategory() {
        defaults.set(selection.rawValue, forKey: defaultsKey)
    }
}

//@available(iOS 14.0, *)
//struct EmojiCategoryMenu_Keyboard: PreviewProvider {
//    static var previews: some View {
//        EmojiCategoryKeyboard(selection: .constant(.activities))
//    }
//}
