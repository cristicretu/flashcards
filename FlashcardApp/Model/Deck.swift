//
//  Deck.swift
//  FlashcardApp
//
//  Created by Cristian Cretu on 30.11.2023.
//

import Foundation
import SwiftData
import SwiftUI

@Model
final class Deck {
    var id: UUID
    var name: String
    var cards: [Card]
    
    init(id: UUID, name: String, cards: [Card]) {
        self.id = id
        self.name = name
        self.cards = cards
    }

}

// mock data
let mathDeck = Deck(
    id: UUID(),
    name: "Math",
    cards: [
        Card(id: UUID(), front: "What is 2 + 2?", back: "The answer is 4."),
        Card(id: UUID(), front: "What is the square root of 9?", back: "The answer is 3."),
        Card(id: UUID(), front: "Solve x in the equation 2x = 10", back: "x equals 5.")
    ]
)

let historyDeck = Deck(
    id: UUID(),
    name: "History",
    cards: [
        Card(id: UUID(), front: "Who was the first president of the United States?", back: "George Washington."),
        Card(id: UUID(), front: "In which year did World War II end?", back: "1945."),
        Card(id: UUID(), front: "What was the main cause of the French Revolution?", back: "Social and economic inequalities.")
    ]
)

let geographyDeck = Deck(
    id: UUID(),
    name: "Geography",
    cards: [
        Card(id: UUID(), front: "What is the capital of France?", back: "Paris."),
        Card(id: UUID(), front: "Which desert is the largest in the world?", back: "The Sahara Desert."),
        Card(id: UUID(), front: "Name the longest river in the world.", back: "The Nile River.")
    ]
)

let decks: [Deck] = [mathDeck, historyDeck, geographyDeck]
