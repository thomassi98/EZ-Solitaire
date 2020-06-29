//
//  CardFactoryTests.swift
//  UnitTests
//
//  Created by Thomas Solberg Irgens on 29/06/2020.
//  Copyright © 2020 Thomas S. Irgens. All rights reserved.
//

import XCTest

class CardFactoryTests: XCTestCase {
    
    func noDupes(cards: [Card]) -> Bool {
        //Check for card duplicates
        
        //Convets list to Set, removing duplicates in the process
        let cardSet = Set(cards)
        
        
/*        for card1 in list {
            for card2 in Array(list[1...]) {
                if card1 == card2 {
                    return false
                }
            }
        }
        return true
    }
  */
    func requiredSize(list: [Card], num: Int) -> Bool {
        //Check if deck size matches num
        if list.count == num {
            return true
        }
        return false
    }
    
    func testStandardDeck() {
        //Tests that Card Factory can build and return proper decks
        let N = 100
        var iteration = 0
        
        while iteration < N {
            iteration += 1
            
            let factory = CardFactory()
            let deck = factory.standardDeck()
            
            //Check for duplicates
            XCTAssertTrue(noDupes(list: deck))
            //Check for right deck size
            XCTAssertTrue(requiredSize(list: deck, num: 32))

        }
    }
}
