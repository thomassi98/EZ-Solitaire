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
    
    
    ///Tests chooseCard matching
    func testChooseCardMatchesCards() {
        let game = GameModel()
        let card1 = Card(type: "clubs", value: "7")
        let card2 = Card(type: "hearts", value: "7")
        
        game.chooseCard(card: card1)
        game.chooseCard(card: card2)
        
        XCTAssertEqual(card1.isMatched(), true)
        XCTAssertEqual(card2.isMatched(), true)
    }
    
    
    ///Tests that dealCard deals one Card object from correct stack
    func testdealCardDealsCorrectly() {
        let N = 100
        var counter = 0
        
        while counter < N {
            let game = GameModel()
            
            try! game.dealCard(stackNum: 1)
            try! game.dealCard(stackNum: 5)

            let gameDeck = game.copyDeck()
            
            //Relies on game.copyDeck() to work
            XCTAssertEqual(gameDeck[1].count, 3)
            XCTAssertEqual(gameDeck[5].count, 3)
            
            counter += 1
        }

    }
    
    
    ///Tests that dealCards deals one Card object from each stack
    func testdealCardsDealsCorrectly() {
        let N = 100
        var counter = 0
        
        while counter < N {
            let game = GameModel()
            
            try! game.dealCards()
            
            
            for stacks in game.copyDeck() {
                //Checks that cards have been removed from all stacks
                XCTAssertEqual(stacks.count, 3)
            }
            counter += 1
        }

        
    }
    
    
    ///Checks that the copyDeck function returns an identical version of the deck
    func testCopyDeck() {
        let N = 1
        var counter = 0
        
        while counter < N {
            let game = GameModel()
            let deckCopy = game.copyDeck()
            let firstCards = try! game.dealCards()
            
            for index in 0..<8 {
                print("Index: " + String(index))
                
                //Checks only value. because == override excepts identical Card objects
                let card1 = deckCopy[index][0].getValue()
                let card2 = firstCards[index].getValue()
                
                XCTAssertEqual(card1, card2)
            }
            counter += 1
        }

    }
    
    
    ///Tests that winCheck function can confirm win condition
    func testwinCheck() {
        let game = GameModel()
        
        for _ in 1...4 {
            try! game.dealCards()
        }
        XCTAssertEqual(game.winCheck(), true)
    }
    
    ///Tests that lossCheck function can confirm loss conditions
    func testlossCheck() {
        let game = GameModel()
        
        let impossibleCard = Card(type: "placeholder", value: "placeholder")
        var hand = [Card]()
        
        for i in 1...8 {
            hand.append(impossibleCard)
        }
        game.updateHand(stack: hand)
        
        XCTAssertEqual(game.lossCheck(), true)
    }
}
