//
//  AutocompleteToolbar.swift
//  KeyboardKit
//
//  Created by Daniel Saidi on 2020-09-13.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import KeyboardKit
import SwiftUI

/**
 This view creates a horizontal row with autocomplete button
 views and separators. You can customize the buttons and the
 separators by injecting custom view builders in `init`.
 
 Note that you should not apply actions to custom views that
 you create in a custom `buttonBuilder`. This view will wrap
 those views within a button, that replaces the current word
 in the text document proxy with the tapped word.
 
 The view tries to resolve an `ObservableAutocompleteContext`
 as an `@EnvironmentObject`. If no observable context exists,
 the view will crash in runtime.
 */
public struct AutocompleteToolbar: View {
    
    /**
     Create a new autocomplete toolbar.
     - Parameters:
         - buttonBuilder: An optional, custom button builder. If you don't provide one, `standardButton` will be used.
         - separatorBuilder: An optional, custom separator builder. If you don't provide one, `standardSeparator` will be used.
     */
    public init(
        buttonBuilder: @escaping ButtonBuilder = Self.standardButton,
        separatorBuilder: @escaping SeparatorBuilder = Self.standardSeparator) {
        self.buttonBuilder = buttonBuilder
        self.separatorBuilder = separatorBuilder
    }
    
    private let buttonBuilder: ButtonBuilder
    private let separatorBuilder: SeparatorBuilder
    
    public typealias ButtonBuilder = (Word) -> AnyView
    public typealias SeparatorBuilder = (Word) -> AnyView
    public typealias Word = String
    
    @EnvironmentObject private var autocompleteContext: ObservableAutocompleteContext
    @EnvironmentObject private var keyboardContext: ObservableKeyboardContext
    
    public var body: some View {
        HStack {
            ForEach(autocompleteContext.suggestions, id: \.self) {
                self.view(for: $0)
            }
        }
    }
}

public extension AutocompleteToolbar {
    
    /**
     This is the standard button builder function, that will
     be used if no custom builder is provided in init.
     */
    static func standardButton(for word: Word) -> AnyView {
        AnyView(Text(word)
            .lineLimit(1)
            .frame(maxWidth: .infinity))
    }
    
    /**
     This is the standard button separator that will be used
     if no custom separator is provided in init.
     */
    static func standardSeparator(for word: Word) -> AnyView {
        AnyView(Color.secondary
            .opacity(0.5)
            .frame(width: 1)
            .padding(.vertical, 8))
    }
}

private extension AutocompleteToolbar {
    
    func view(for word: String) -> some View {
        Group {
            Button(action: { self.keyboardContext.textDocumentProxy.replaceCurrentWord(with: word) }) {
                buttonBuilder(word)
            }.buttonStyle(PlainButtonStyle())
            
            if word != autocompleteContext.suggestions.last {
                separatorBuilder(word)
            }
        }
    }
}

struct AutocompleteToolbar_Previews: PreviewProvider {
    static var previews: some View {
        AutocompleteToolbar()
    }
}
