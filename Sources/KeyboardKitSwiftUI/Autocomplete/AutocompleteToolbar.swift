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
    
    @EnvironmentObject private var context: ObservableAutocompleteContext
    @EnvironmentObject private var keyboardContext: ObservableKeyboardContext
    
    public var body: some View {
        HStack {
            ForEach(context.suggestions, id: \.title) {
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

extension AutocompleteToolbar {
    
    /**
     The action to perform when a suggestion is tapped.
     */
    static func action(for suggestion: AutocompleteSuggestion, context: KeyboardContext) -> () -> Void {
        return {
            let proxy = context.textDocumentProxy
            let replacement = Self.replacement(for: suggestion, proxy: proxy)
            proxy.insertText(replacement)
            context.actionHandler.handle(.tap, on: .character(""))
        }
    }
    
    /**
     Calculates the replacement for a suggestion and certain
     text proxy.
     */
    static func replacement(for suggestion: AutocompleteSuggestion, proxy: UITextDocumentProxy) -> String {
        let space = " "
        let replacement = suggestion.replacement
        let endsWithSpace = replacement.hasSuffix(space)
        let hasNextSpace = proxy.documentContextAfterInput?.starts(with: space) ?? false
        let insertSpace = endsWithSpace || hasNextSpace
        return insertSpace ? replacement : replacement + space
    }
}

private extension AutocompleteToolbar {
    
    func isLast(_ suggestion: AutocompleteSuggestion) -> Bool {
        let replacement = suggestion.replacement
        let lastReplacement = context.suggestions.last?.replacement
        return replacement == lastReplacement
    }
    
    func view(for suggestion: AutocompleteSuggestion) -> some View {
        Group {
            Button(action: Self.action(for: suggestion, context: keyboardContext)) {
                buttonBuilder(suggestion)
            }
            .background(Color.clearInteractable)
            .buttonStyle(PlainButtonStyle())
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
