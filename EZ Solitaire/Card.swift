//
//  Card.swift
//  EZ Solitaire
//
//  Created by Thomas Solberg Irgens on 23/06/2020.
//  Copyright © 2020 Thomas S. Irgens. All rights reserved.
//

import Foundation

class Card{
    private var type: String
    private var value: String
    private var image: String
    private var isMatched = false
    
    
    init(type: String, value: String, image: String){
        self.type = type
        self.value = value
        self.image = image
    }
    
    func getType() -> String {
        return type
    }
    
    func getNumber() -> String {
        return value
    }
    
    func match() -> Void {
        isMatched = true
    }
}
