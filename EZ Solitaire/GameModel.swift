//
//  GameModel.swift
//  EZ Solitaire
//
//  Created by Arild Solberg on 23/06/2020.
//  Copyright © 2020 Thomas S. Irgens. All rights reserved.
//

import Foundation

class GameModel{
    private var deck = [Card]()
    
    init(){
        let factory = CardFactory()
        deck = factory.standardDeck()
    }
    
    func getDeck() -> [Card] {
        return deck
    }
}
