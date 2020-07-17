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
    
    var isFlipped = false
    var card: Card?
    
    ///Sets front image for Card cell
    /// - Parameter card: Card object
    func setCard(_ card: Card) {
        self.card = card
        
        frontImageView.image = UIImage(named: card.getImage())
        
        
    }
    
    ///Toggles highlight on Card cell
    ///- Parameter card: Card object
    func toggleHighlight() {
        
    //    UIView.transition(from: frontImageView, to: frontImageView, duration: <#T##TimeInterval#>, options: <#T##UIView.AnimationOptions#>, completion: <#T##((Bool) -> Void)?##((Bool) -> Void)?##(Bool) -> Void#>)
        
    }
    
    ///Flips Card cell from back to front
    func flip() {
        
        UIView.transition(from: backImageView, to: frontImageView, duration: 0.2, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
        
        isFlipped = true
        
    }
    
    ///Flips Card Cell from front to back
    func flipBack() {
        UIView.transition(from: frontImageView, to: backImageView, duration: 0.2, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
        
        isFlipped = false

    }
}
