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
    
    private var index = 0
    private var numLabel = UILabel()
    private var cardsLeft = 5       //Initial value will be 4 after setting Card
    private var chosen = false
    private var flipped = false
    private var card = Card(type: "placeholder", value: "placeholder")
    
    
    func setIndex(index: Int) {
        self.index = index
    }
    
    func getIndex() -> Int {
        return index
    }
    
    ///Sets front image for Card cell
    /// - Parameter card: Card object
    func setCard(_ card: Card) {
        if cardsLeft > 0 {
            cardsLeft -= 1
            changeNumLabel(text: String(cardsLeft))
        }
        self.card = card
        
        frontImageView.image = UIImage(named: card.getImage())
    }
    
    ///Adds a text label on the right corner of the Cell
    /// - Parameter text: String, desired text
    func addNumLabel(text: String) {
        numLabel = UILabel(frame: CGRect(x: self.bounds.maxX-20, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        numLabel.backgroundColor = UIColor.black
        numLabel.text = " "+text+" "
        numLabel.font.withSize(16)
        numLabel.textColor = UIColor.white
        numLabel.sizeToFit()
        numLabel.layer.cornerRadius = numLabel.frame.size.height/2
        numLabel.layer.masksToBounds = true
        //numLabel.layer.cornerRadius = numLabel.frame.width/2
        //textView.textAlignment = .center
        addSubview(numLabel)
    }
    
    ///Changes text label on the right corner of the Cell
    /// - Parameter text: String, desired text
    func changeNumLabel(text: String) {
        numLabel.text = " "+text+" "
    }
    
    ///Edits the Label to display "Empty" when Card stack is empty
    func displayEmpty() {
        //Removes old label
        numLabel.removeFromSuperview()
        
        //Adds new
        numLabel = UILabel(frame: CGRect(x: self.bounds.midX-25, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        numLabel.text = "Empty"
        numLabel.textColor = UIColor.white
        numLabel.sizeToFit()
        //numLabel.layer.cornerRadius = numLabel.frame.width/2
        //textView.textAlignment = .center
        addSubview(numLabel)

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
