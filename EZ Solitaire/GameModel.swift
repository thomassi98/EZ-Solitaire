//
//  GameModel.swift
//  EZ Solitaire
//
//  Created by Thomas Solberg Irgens on 23/06/2020.
//  Copyright © 2020 Thomas S. Irgens. All rights reserved.
//

import Foundation

class GameModel{
    
    private var deck = [[Card]]() //Nestled list with 8 stacks of 4 Card objects
    private var choices = [Card]()
    private var choiceCounter: Int
    private var currentHand = [Card]()
    
    init(){
        choiceCounter = 0
        generateDeck()
    }
    
    ///Calls on CardFactory to generate a standard deck and store it
    func generateDeck() {
        let factory = CardFactory()
        deck = factory.standardDeck()
    }
    
    func remainingCards() -> Int {
        return Array(deck.joined()).count
    }
    
    ///Updates hand
    /// - Parameter stack: Array of 8 Card objects
    func updateHand(stack: [Card]) {
        currentHand = stack
    }
    
    ///Chooses Card if no more than one unmatched Card object is chosen, deselects the chosen Card objects otherwise. If chosen and selected Card object matches, they are marked as such.
    /// - Parameter card: Target Card object
    func chooseCard(card: Card) {
        switch choiceCounter {
        case 0:
            choices.append(card)
            card.choose()
            choiceCounter += 1
        case 1:
            if choices[0].getType() != card.getType() {
                choices[0].matchBoth(card)
            }
            deselectChoices()
            clearChoices()
        default:
            deselectChoices()
            clearChoices()
        }
    }

    
    
    ///Deselects choices if there are any
    func deselectChoices() {
        if !choices.isEmpty {
            for card in choices {
                card.unChoose()
            }
        }
    }
    
    ///Resets choices
    func clearChoices() {
        choices = [Card]()
        choiceCounter = 0
    }

    
    ///Removes 8 Card objects from all stacjs in the deck and returns them, if possible
    /// - Returns: Array of 8 Card objects,
    /// - Throws: insuffficientCards(cardsNeeded) when not enough Card objects left in deck array.
    func dealCards() throws -> [Card]  {
        
        if canDealCards() {
            var hand = [Card]()
            
            for stackIndex in 0...7 {
                hand.append(deck[stackIndex][0])
                deck[stackIndex].remove(at: 0)
            }
            currentHand = hand
            return hand
        }
        else {
            throw gameError.insufficientCards(cardsNeeded: 8)
        }
    }
    
    
    ///Removes 1 Card object from deck and returns it.
    /// - Parameter deck: Int, which deck to deal from 1-8
    /// - Returns: Card object.
    /// - Throws: insuffficientCards(cardsNeeded) when not enough Card objects left in deck array.
    func dealCard(stackNum: Int) throws -> Card {
        
        if hasCards(stack: deck[stackNum], amount: 1) {
            return deck[stackNum].remove(at: 0)
        }
        else {
            throw gameError.insufficientCards(cardsNeeded: 1)
        }
    }

    
    ///Returns true if array of Cards  has amount or more Card objects left
    /// - Parameters:
    ///     - deck: Array of Card objects
    ///     - amount: Amount of objects left in question
    /// - Returns: True if amount or more objects left, false otherwise
    func hasCards(stack: [Card], amount: Int) -> Bool {
        if stack.count >= amount  {
            return true
        }
        return false
    }
    
    ///Checks if there are enough cards to deal from every deck
    /// - Parameter amount: Int, how many decks left in question
    func canDealCards() -> Bool {
        for stacks in deck {
            if stacks.count == 0 {
                return false
            }
        }
        return true
    }
    
    ///Copies deck Array
    /// - Returns: A  copy of deck array, Card references stay the same
    func copyDeck() -> [[Card]] {
        
        var deckCopy = [[Card]]()
        var stackCopy = [Card]()
        
        for stack in deck {
            for card in stack {
                stackCopy.append(card)
            }

            deckCopy.append(stackCopy)
            stackCopy = [Card]()
        }
        
        return deckCopy
    }
    
    ///Checks and confirms win conditions
    /// - Returns: True if win conditions are met, false otherwise
    func winCheck() -> Bool {
        var placeHolderCounter = 0
        
        for card in currentHand {
            if card.getType() == "placeholder" {
                placeHolderCounter += 1
            }
        }
        
        if placeHolderCounter == 8 {
            return true
        }
        
    return false
    }
    
    
    ///Checks and confirms loss conditions
    /// - Returns: True if loss conditions are met, false otherwise
    func lossCheck() -> Bool {
        var matches = 0
        for card1 in currentHand {
            for card2 in currentHand {
                
                if card1 == card2 {
                    matches += 1
                }
            }
        }
        
        if (matches > 0) {
            return false
        }
        print("you lose")
        return true
    }
    
    
    ///Errors for GameModel
    enum gameError: Error {
        case insufficientCards(cardsNeeded: Int)
    }
}
