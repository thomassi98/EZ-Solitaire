//
//  GameModelTest.swift
//  UnitTests
//
//  Created by Thomas Solberg Irgens on 29/06/2020.
//  Copyright © 2020 Thomas S. Irgens. All rights reserved.
//

import XCTest

@testable import EZ_Solitaire

class GameModelTest: XCTestCase {
    
    ///Tests that GameModel creates and stores proper deck
    func testStoreDeck(){
        
        let N = 100
        var iteration = 0
            
        while iteration < N {
            let game = GameModel()
            iteration += 1
            
            XCTAssertEqual(32, game.remainingCards())
        }
    }
    
    ///Tests choosing/higlighting system
    func testMax2Choices() {
        let game = GameModel()
        let deck = try! game.dealCards()
        
        game.chooseCard(card: deck[0])
        game.chooseCard(card: deck[3])
        
        XCTAssertEqual(deck[0].isChosen(), false)
        XCTAssertEqual(deck[3].isChosen(), false)
        
        game.chooseCard(card: deck[5])
        
        XCTAssertEqual(deck[0].isChosen(), false)
        XCTAssertEqual(deck[3].isChosen(), false)
        XCTAssertEqual(deck[5].isChosen(), true)
        
        game.chooseCard(card: deck[5])
        game.chooseCard(card: deck[0])
        
        XCTAssertEqual(deck[0].isChosen(), true)
        XCTAssertEqual(deck[3].isChosen(), false)
        XCTAssertEqual(deck[5].isChosen(), false)
        
    }
}
