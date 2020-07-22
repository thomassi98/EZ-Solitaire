//
//  CardFactory.swift
//  EZ Solitaire
//
//  Created by Thomas Solberg Irgens on 23/06/2020.
//  Copyright © 2020 Thomas S. Irgens. All rights reserved.
//

import Foundation

class CardFactory{
    
    ///Returns a nested  array containing  a standard Wish Solitaire deck
    /// - Returns: Nested array containing 32 unique Card objects evenly split in 8 subarrays
    func standardDeck() ->  [[Card]] {
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
        
        let stackedDeck = try! splitStacks(deck: deck)
        
        return stackedDeck
    }
    
    ///Makes sure individual Solitaire Card stacks does not contain more than two matching cards.
    /// - Returns: True if playable, false otherwise
    func isPlayable(stack: [Card]) -> Bool {
        var indCopies = 1
        let card1 = stack[0]
        let card2 = stack[1]
        
        //Checks for matches of card1
        for card in stack[1..<4] {
            if card == card1 {
                indCopies += 1
            }
            if (indCopies == 3) {
                return false
            }
        }
        
        indCopies = 1
        
        //Checks for matches of card2
        for card in stack[2..<4]{
            if card == card2 {
                indCopies += 1
            }
            if (indCopies == 3) {
                return false
            }
        }
        
        return true
    }
    
    ///Splits deck into stacks
    /// - Parameter deck: Array containing 32 Card objects
    func splitStacks(deck: [Card]) throws -> [[Card]] {
        if (deck.count != 32) {
            throw GameModel.gameError.insufficientCards(cardsNeeded: 32 - deck.count)
        }
        var oldDeck = deck
        var nestedDeck = [[Card]]()
        var stack = [Card]()
        
        var counter = 0
        
        while oldDeck.count > 0 {
            while counter < 4 {
                stack.append(oldDeck.remove(at: 0))
                counter += 1
            }
            
            //Adds stack to nested Deck if playable
            if (isPlayable(stack: stack)) {
                nestedDeck.append(stack)
                stack = [Card]()
                counter = 0
            }
                
            //Resets decks and tries again (to make Card order unpredictable)
            else {
                //for card in stack {
                //    oldDeck.append(card)
                //}
                counter = 0
                oldDeck = deck
                nestedDeck = [[Card]]()
                stack = [Card]()
                
                oldDeck.shuffle()
            }
        }
        return nestedDeck
    }
}
