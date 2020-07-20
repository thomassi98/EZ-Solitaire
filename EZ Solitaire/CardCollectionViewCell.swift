//
//  CardCollectionViewCell.swift
//  EZ Solitaire
//
//  Created by Thomas Solberg Irgens on 30/06/2020.
//  Copyright © 2020 Thomas S. Irgens. All rights reserved.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var frontImageView: UIImageView!
    @IBOutlet private weak var backImageView: UIImageView!
    
    private var chosen = false
    private var flipped = false
    private var card = Card(type: "placeholder", value: "placeholder")
    
    
    ///Sets front image for Card cell
    /// - Parameter card: Card object
    func setCard(_ card: Card) {
        self.card = card
        
        frontImageView.image = UIImage(named: card.getImage())
    }
    
    
    /// - Returns: Cells associated Card object
    func getCard() -> Card {
        return card
    }
    
    
    ///Returns the chosen state of the cell
    /// - Returns: True if chosen, false otherwise
    func isChosen() -> Bool {
        return chosen
    }
    
    
    func isFlipped() -> Bool {
        return flipped
    }
    
    
    ///Flips Card cell from back to front
    func flip() {
        
        UIView.transition(from: backImageView, to: frontImageView, duration: 0.2, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
        
        flipped = false
    
        
    }
    
    ///Flips Card Cell from front to back
    func flipBack() {
        UIView.transition(from: frontImageView, to: backImageView, duration: 0.2, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
        
        flipped = true

    }
    
    
    ///Highlights cell
    func choose() {
        chosen = true
        layer.backgroundColor = UIColor.gray.cgColor
    }
    
    
    ///Removes highlighting from cell
    func unChoose() {
        chosen = false
        layer.backgroundColor = UIColor.clear.cgColor
    }
}
