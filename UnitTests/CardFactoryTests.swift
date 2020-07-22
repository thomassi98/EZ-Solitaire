//
//  CardFactoryTests.swift
//  UnitTests
//
//  Created by Thomas Solberg Irgens on 29/06/2020.
//  Copyright © 2020 Thomas S. Irgens. All rights reserved.
//

import XCTest

class CardFactoryTests: XCTestCase {
    
    //TODO move to CardFactory and test here instead?
    ///Checks for Card duplicates in Card Array
    /// - Parameter cards: Array of Card objects
    /// - Returns: Bool, true if no duplicates, false otherwise
    func noDupes(cards: [Card]) -> Bool {
        //TODO make prettier
        
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
        let N = 1000
        var iteration = 0
        
        while iteration < N {
            iteration += 1
            
            let factory = CardFactory()
            let deck = factory.standardDeck()
            
            //Check for duplicates
            XCTAssertTrue(noDupes(cards: deck))
            //Check for right deck size
            XCTAssertTrue(requiredSize(list: deck, num: 32))

        }
    }
}
