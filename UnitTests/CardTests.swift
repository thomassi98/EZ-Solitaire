//
//  EZ_SolitaireUITests.swift
//  EZ SolitaireUITests
//
//  Created by Thomas Solberg Irgens on 22/06/2020.
//  Copyright © 2020 Thomas S. Irgens. All rights reserved.
//

import XCTest
import Foundation
@testable import EZ_Solitaire

class CardTests: XCTestCase {

    ///Tests that Card instantiates and stores values properly
    func testCardValues(){
        let card = Card(type: "diamonds", value: "ace")
        
        XCTAssertEqual(card.getType(), "diamonds")
        XCTAssertEqual(card.getValue(), "ace")
        XCTAssertEqual(card.getImage(), "ace_of_diamonds")
        
    }
    

    ///Tests Card object match function
    func testTryMatch() {
        let card = Card(type: "diamonds", value: "ace")
        let card2 = Card(type: "diamonds", value: "ace")
        
        XCTAssertEqual(card.isMatched(), false)
        card.tryMatch(card2)
        card2.tryMatch(card)
        XCTAssertEqual(card.isMatched(), true)
    }
    
    ///Tests Card object mutual match function
    func testMatchBoth() {
        let card = Card(type: "diamonds", value: "ace")
        let card2 = Card(type: "diamonds", value: "ace")
        
        XCTAssertEqual(card.isMatched(), false)
        card.matchBoth(card2)
        XCTAssertEqual(card.isMatched(), true)
    }
    
    
}
