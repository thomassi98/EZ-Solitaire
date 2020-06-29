//
//  CardFactoryTests.swift
//  UnitTests
//
//  Created by Thomas Solberg Irgens on 29/06/2020.
//  Copyright © 2020 Thomas S. Irgens. All rights reserved.
//

import XCTest

class CardFactoryTests: XCTestCase {
    
    //TODO move to CardFactory and test here?
    func noDupes(cards: [Card]) -> Bool {
        //Check for card duplicates
        //TODO make prettier
        
        for card1 in cards {
            var index2 = 1
            for card2 in Array(cards[index2...]) {
                if card1 == card2 {
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
    
    func requiredSize(list: [Card], num: Int) -> Bool {
        //Check if deck size matches num
        if list.count == num {
            return true
        }
        return false
    }
    
    func testStandardDeck() {
        //Tests that Card Factory can build and return proper decks
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
