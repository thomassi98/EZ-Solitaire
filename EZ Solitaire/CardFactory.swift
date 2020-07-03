//
//  CardFactory.swift
//  EZ Solitaire
//
//  Created by Thomas Solberg Irgens on 23/06/2020.
//  Copyright © 2020 Thomas S. Irgens. All rights reserved.
//

import Foundation

class CardFactory{
    
    ///Returns an array with a standard Wish Solitaire deck
    /// - Returns: Array containing 32 unique Card objects
    func standardDeck() ->  [Card] {
        var deck = [Card]()
        let types = ["clubs", "diamonds", "hearts", "spades"]
        let values = ["ace", "7", "8", "9", "10", "jack", "queen", "king"]
        
        for value in values{
            for type in types{
                let card = Card(type: type, value: value)
                deck.append(card)
            }
        }
        deck.shuffle()
        return deck
    }
}
