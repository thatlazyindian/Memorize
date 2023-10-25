//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Nakul Agrawal on 10/25/23.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    func choose(card: Card) {
        
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
//    May have to add something here for Assignment 2
}
