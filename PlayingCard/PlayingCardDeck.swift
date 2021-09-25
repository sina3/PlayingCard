//
//  PlayingCardDeck.swift
//  PlayingCard
//
//  Created by Sina on 2021-06-04.
//

import Foundation

struct PlayingCardDeck {
    private(set) var cards = [PlayingCard]()
    
    init() {
        for suit in PlayingCard.Suit.all {
            for rank in PlayingCard.Rank.all {
                cards.append(PlayingCard(suit: suit, rank: rank))
            }
        }
    }
    mutating func draw() -> PlayingCard? {
        if cards.count > 0 {
            return cards.remove(at: cards.count.arc4random)
        } else {
            return nil
        }
    }
}


extension Int {
    var arc4random: Int {
        var randNum: Int
        if self > 0 {
            randNum = Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            randNum = -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            randNum = 0
        }

        return randNum
    }
}
