//
//  CardFactoryTests.swift
//  UnitTests
//
//  Created by Thomas Solberg Irgens on 29/06/2020.
//  Copyright © 2020 Thomas S. Irgens. All rights reserved.
//

import XCTest

class CardFactoryTests: XCTestCase {
    
    ///Checks for Card duplicates in Card Array
    /// - Parameter cards: Array of Card objects
    /// - Returns: Bool, true if no duplicates, false otherwise
    func noDupes(cards: [Card]) -> Bool {
        
        for card1 in cards {
            var index2 = 1
            for card2 in Array(cards[index2...]) {
                if card1 == card2 && card1.getType() == card2.getType(){
                    return false
                }
                index2 += 1
                if index2 == cards.count-1 {
                    return true
                }
            }
        }
        return true
    }
    
    ///Checks that Card array size is correct
    /// - Parameters :
    ///     - list: Array containing Card objects
    ///     - num: Desired array size
    /// - Returns: Bool, true if array contains num amount of Card, false otherwise
    func requiredSize(list: [Card], num: Int) -> Bool {
        if list.count == num {
            return true
        }
        return false
    }
    
    ///Tests that CardFactory can build and return proper decks
    func testStandardDeck() {
        let N = 100
        var iteration = 0
        
        while iteration < N {
            iteration += 1
            
            let factory = CardFactory()
            let nestedDeck = factory.standardDeck()
            let flattenedDeck = Array(nestedDeck.joined())
            
            //Check for duplicates
            //XCTAssertTrue(noDupes(cards: flattenedDeck))
            //Check for right deck size
            XCTAssertTrue(requiredSize(list: flattenedDeck, num: 32))

        }
    }
    
    ///Tests that isPlayable doesn´t accept unplayable stacks
    func testisPlayable() {
        let factory = CardFactory()
        
        let card1 = Card(type: "clubs", value: "9")
        let card2 = Card(type: "diamonds", value: "9")
        let card3 = Card(type: "hearts", value: "9")
        let card4 = Card(type: "spades", value: "8")
        
        let card5 = Card(type: "clubs", value: "8")
        let card6 = Card(type: "diamonds", value: "9")
        let card7 = Card(type: "hearts", value: "9")
        let card8 = Card(type: "spades", value: "9")

        let unplayable1 = [card1, card2, card3, card4]
        let unplayable2 = [card5, card6, card7, card8]
        
        let card9 = Card(type: "clubs", value: "8")
        let card10 = Card(type: "diamonds", value: "9")
        let card11 = Card(type: "hearts", value: "9")
        let card12 = Card(type: "spades", value: "8")
        
        let playable = [card9, card10, card11, card12]
        
        XCTAssertEqual(factory.isPlayable(stack: unplayable1), false)
        XCTAssertEqual(factory.isPlayable(stack: unplayable2), false)
        XCTAssertEqual(factory.isPlayable(stack: playable), true)
    }
    
    ///Tests that splitStacks doesn´t let unplayable stacks through
    func testsplitStacksPlayable() {
        let N = 10
        var counter = 0
        
        while counter < N {
            let factory = CardFactory()
            let deck = factory.standardDeck()
            
            for stack in deck {
                XCTAssertEqual(factory.isPlayable(stack: stack), true)
            }
            counter += 1
        }
    }
}
