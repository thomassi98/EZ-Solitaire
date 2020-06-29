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

    func testCardValues(){
        //Tests that Card instantiates and stores values properly
        
        let card = Card(type: "diamonds", value: "ace")
        
        XCTAssertEqual(card.getType(), "diamonds")
        XCTAssertEqual(card.getValue(), "ace")
        XCTAssertEqual(card.getImage(), "ace_of_diamonds")
        
    }
    

    func testMatch() {
        //Tests match function
        
        let card = Card(type: "diamonds", value: "ace")
        
        XCTAssertEqual(card.isMatched(), false)
        card.match()
        XCTAssertEqual(card.isMatched(), true)
    }
    
}
