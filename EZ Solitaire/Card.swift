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
    
    ///Override of == function to compare by data instead of reference
    static func == (lhs: Card, rhs: Card) -> Bool {
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
    
    ///Gets Card type
    /// - Returns: String containing type name
    func getType() -> String {
        return type
    }
    
    ///Gets Card value
    /// - Returns: String containing value name
    func getValue() -> String {
        return value
    }
    
    ///Gets Card image name
    /// - Returns: String containing image name
    func getImage() -> String {
        return image
    }
    
    ///Checks if this Card matches with other Card
    /// - Parameter other: Other Card object to be compared
    /// - Returns: True if Card objects  match, False otherwise
    func isMatch(other: Card) -> Bool {
        return self == other
    }
    
    ///Gets Card match state
    /// - Returns: Bool, true if Card is matched, false otherwise
    func isMatched() -> Bool{
        return matched
    }
    
    ///Changes Card match state to true
    func match() -> Void {
    //Returns true if card has already been matched, false otherwise
        matched = true
    }
}
