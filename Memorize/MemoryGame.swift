//
//  MemoryGame.swift
//  Memorize
//
//  Created by Jae-hoon Sim on 2022/07/20.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {

    struct Card: Identifiable {

        var isFaceUp = false
        var isMatched = false
        var content: CardContent
        var id: Int
    }

    private(set) var cards: [Card]

    private var indexOfTheOneAndOnlyFaceUpCard: Int?

    init(numberOfParsOfCards: Int, createCardContent: (Int) -> CardContent) {
        self.cards = [Card]()

        for pairIndex in 0..<numberOfParsOfCards {
            let content = createCardContent(pairIndex)
            self.cards.append(Card(content: content, id: pairIndex * 2))
            self.cards.append(Card(content: content, id: pairIndex * 2 + 1))
        }
    }

    mutating func choose(_ card: Card) {
        guard let chosenIndex = self.cards.firstIndex(where: { $0.id == card.id }),
              !self.cards[chosenIndex].isFaceUp,
              !self.cards[chosenIndex].isMatched else {
            return
        }
        guard let potentialMatchIndex = self.indexOfTheOneAndOnlyFaceUpCard else {
            for index in cards.indices {
                cards[index].isFaceUp = false
            }
            self.indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            self.cards[chosenIndex].isFaceUp.toggle()
            return
        }
        if self.cards[potentialMatchIndex].content == self.cards[chosenIndex].content {
            cards[chosenIndex].isMatched = true
            cards[potentialMatchIndex].isMatched = true
        }
        self.indexOfTheOneAndOnlyFaceUpCard = nil
        self.cards[chosenIndex].isFaceUp.toggle()
    }

    private func index(of card: Card) -> Int? {
        for index in 0..<cards.count {
            if cards[index].id == card.id {
                return index
            }
        }
        return nil
    }
}
