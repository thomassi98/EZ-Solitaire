//
//  Card.swift
//  EZ Solitaire
//
//  Created by Thomas Solberg Irgens on 23/06/2020.
//  Copyright © 2020 Thomas S. Irgens. All rights reserved.
//

import Foundation

class Card : Equatable {

    
    private var type: String
    private var value: String
    private var image: String
    private var matched = false
    
    
    init(type: String, value: String){
        self.type = type
        self.value = value
        self.image = value+"_of_"+type
    }
    
    
    static func == (lhs: Card, rhs: Card) -> Bool {
        //Override of == function to compare by data instead of reference
        if lhs.getType() != rhs.getType() {
            return false
        }
        if lhs.getValue() != rhs.getValue() {
            return false
        }
        if lhs.getImage() != rhs.getImage() {
            return false
        }
        return true
    }
    
    //Returns card type
    func getType() -> String {
        return type
    }
    
    //Returns card value
    func getValue() -> String {
        return value
    }
    
    //Returns card image name
    func getImage() -> String {
        return image
    }
    
    //Returns card match state
    func isMatched() -> Bool{
        return matched
    }
    
    //Returns true if card has already been matched, false otherwise
    func match() -> Void {
        matched = true
    }
}
