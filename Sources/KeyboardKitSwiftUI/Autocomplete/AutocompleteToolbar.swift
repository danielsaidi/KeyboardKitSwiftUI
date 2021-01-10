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
 views and separators.
 
 You can customize the button and the separator by injecting
 a custom `buttonBuilder` and/or `separatorBuilder`. When so,
 make sure to just return the button view without any button
 behavior, since the view will be wrapped in a button.
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
    private var proxy: UITextDocumentProxy { keyboardContext.textDocumentProxy }
    
    public typealias ButtonBuilder = (AutocompleteSuggestion) -> AnyView
    public typealias SeparatorBuilder = (AutocompleteSuggestion) -> AnyView
    public typealias Word = String
    
    @EnvironmentObject private var autocompleteContext: ObservableAutocompleteContext
    @EnvironmentObject private var keyboardContext: ObservableKeyboardContext
    
    public var body: some View {
        HStack {
            ForEach(autocompleteContext.suggestions, id: \.title) {
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
    static func standardButton(for suggestion: AutocompleteSuggestion) -> AnyView {
        AnyView(Text(suggestion.title)
            .lineLimit(1)
            .frame(maxWidth: .infinity))
    }
    
    /**
     This is the standard button separator that will be used
     if no custom separator is provided in init.
     */
    static func standardSeparator(for suggestion: AutocompleteSuggestion) -> AnyView {
        AnyView(Color.secondary
            .opacity(0.5)
            .frame(width: 1)
            .padding(.vertical, 8))
    }
}

private extension AutocompleteToolbar {
    
    func isLast(_ suggestion: AutocompleteSuggestion) -> Bool {
        let replacement = suggestion.replacement
        let lastReplacement = autocompleteContext.suggestions.last?.replacement
        return replacement == lastReplacement
    }
    
    func view(for suggestion: AutocompleteSuggestion) -> some View {
        let action = { proxy.replaceCurrentWord(with: suggestion.title) }
        return Group {
            Button(action: action) {
                buttonBuilder(suggestion)
            }.buttonStyle(PlainButtonStyle())
            if !isLast(suggestion) {
                separatorBuilder(suggestion)
            }
        }
    }
}

struct AutocompleteToolbar_Previews: PreviewProvider {
    static var previews: some View {
        AutocompleteToolbar()
    }
}
