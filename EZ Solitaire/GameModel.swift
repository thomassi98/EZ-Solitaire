//
//  GameModel.swift
//  EZ Solitaire
//
//  Created by Thomas Solberg Irgens on 23/06/2020.
//  Copyright © 2020 Thomas S. Irgens. All rights reserved.
//

import Foundation

class GameModel{
    private var deck = [Card]()
    
    init(){
        generateDeck()
    }
    
    ///Calls on CardFactory to generate a standard deck and store it
    func generateDeck() {
        let factory = CardFactory()
        deck = factory.standardDeck()
    }

    
    ///Removes 8 Card objects from deck and returns them, if possible
    /// - Returns: Array of 8 Card objects,
    /// - Throws: insuffficientCards(cardsNeeded) when not enough Card objects left in deck array.
    func dealCards() throws -> [Card]  {
        
        if hasCards(amount: 8) {
            var hand = [Card]()
            while hand.count < 8 {
                hand.append(deck.remove(at: 0))
            }
            return hand
        }
        else {
            throw gameError.insufficientCards(cardsNeeded: 8)
        }
    }
    
    
    ///Removes 1 Card object from deck and returns it.
    /// - Returns: Card object.
    /// - Throws: insuffficientCards(cardsNeeded) when not enough Card objects left in deck array.
    func dealCard() throws -> Card {
        if hasCards(amount: 1) {
            return deck.remove(at: 0)
        }
        else {
            throw gameError.insufficientCards(cardsNeeded: 1)
        }
    }

    
    ///Returns true if deck has amount or more Card objects left
    /// - Parameter amount: Amount of objects left in question
    /// - Returns: True if amount or more objects left, false otherwise
    func hasCards(amount: Int) -> Bool {
        if deck.count > amount {
            return true
        }
        return false
    }
    
    
    /// - Returns: an array copy of the deck
    func copyDeck() -> [Card] {
        return deck
    }
    
    
    ///Errors for GameModel
    enum gameError: Error {
        case insufficientCards(cardsNeeded: Int)
    }
}
