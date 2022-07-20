//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Jae-hoon Sim on 2022/07/20.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {

    static let emojis = ["🚂", "🚘", "🚀", "🚁", "🚗", "🚌", "🚜", "🛴", "🏍", "🛸", "✈️", "🛳", "🚤", "⛵️", "🚅", "🚈"]

    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfParsOfCards: 4) { pairIndex in
            EmojiMemoryGame.emojis[pairIndex]
        }
    }

    @Published private var model = MemoryGame<String>(numberOfParsOfCards: 4) { pairIndex in
        EmojiMemoryGame.emojis[pairIndex]
    }

    var cards: [MemoryGame<String>.Card] {
        return model.cards
    }

    // MARK: - Intent(s)

    func choose(_ card: MemoryGame<String>.Card) {
        self.objectWillChange.send()
        self.model.choose(card)
    }
}
