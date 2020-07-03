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
        let game = GameModel()
        
        let N = 100
        var iteration = 0
            
        while iteration < N {
            iteration += 1
            
            let deck = game.getDeck()
            XCTAssertEqual(32, deck.count)
        }
    }
}
