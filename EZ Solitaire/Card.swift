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
    private var chosen = false
    private var matched = false
    
    
    init(type: String, value: String){
        self.type = type
        self.value = value
        self.image = value+"_of_"+type
    }
    
    ///Override of == function to compare by Card only by value, not reference. Cards can´t be exact copies.
    static func == (lhs: Card, rhs: Card) -> Bool {
        if lhs.getType() == rhs.getType() {
            return false
        }
        if lhs.getValue() != rhs.getValue() {
            return false
        }
        if lhs.getImage() == rhs.getImage() {
            return false
        }
        return true
    }
    
    ///Sets isChosen to true
    func choose() {
        chosen = true
    }
    
    ///Sets isChosen to false
    func unChoose() {
        chosen = false
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
    
    ///Sets this Card objects match state to true if similar to other Card object (should be used on both)
    /// - Parameter other: Other Card object to be compared
    func tryMatch(_ other: Card) {
        if self == other {
            self.matched = true
        }
    }
    
    func matchBoth(_ other: Card) {
        tryMatch(other)
        other.tryMatch(self)
    }
    
    ///Gets Card match state
    /// - Returns: Bool, true if Card is matched, false otherwise
    func isMatched() -> Bool{
        return matched
    }
    
    ///Gets Card chosen state
    /// - Returns: Bool, true if Card is chosen, false otherwise
    func isChosen() -> Bool {
        return chosen
    }
}
