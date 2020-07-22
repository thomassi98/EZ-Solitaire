//
//  ViewController.swift
//  EZ Solitaire
//
//  Created by Thomas Solberg Irgens on 22/06/2020.
//  Copyright © 2020 Thomas S. Irgens. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    private var model = GameModel()
    private var hand = [Card]()
    //Card frames
    @IBOutlet private weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Width and height specifications on cells
        let width = view.frame.size.width / 3
        let height = view.frame.size.height / 5
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: height)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        //Get cards
        
        do {
            try hand = model.dealCards()
        } catch {
            print("Error: Not enough cards left in deck.")
        }
    }
    
    
    
    ///Iterates cells and updates them according to game rules
    func doTurn() {
        for cells in collectionView.visibleCells as! [CardCollectionViewCell] {
            //Checks win-conditions
            if model.winCheck() {
                activateVictory()
            }
            //Checks loss-conditions
            if model.lossCheck() {
                activateLoss()
            }
            
            //Attempts to fetch new Card from models deck, flips cell if none found
            if cells.getCard().isMatched() {
                do {
                    //Attempts to fetch new Card
                    let newCard = try model.dealCard(stackNum: cells.getIndex())
                    
                    //Sets new Card in cell
                    cells.setCard(newCard)
                    
                    //Removes old Card from hand and replaces it
                    hand.remove(at: cells.getIndex())
                    hand.insert(newCard, at: cells.getIndex())
                    model.updateHand(stack: hand)
                    
                    //Flip effect
                    cells.flipBack()
                    cells.flip()
                }
                catch {
                    if !cells.isFlipped() {
                        
                        //If Card stack is empty, flips to empty
                        cells.flipBack()
                        cells.displayEmpty()
                        
                        //Inserts placeholder in hand
                        hand.remove(at: cells.getIndex())
                        hand.insert(Card(type: "placeholder", value: "placeholder"), at: cells.getIndex())
                        model.updateHand(stack: hand)
                        
                    }
                }
            }
            
            //Synchronizes chosen cells with associated chosen Card objects
            if cells.getCard().isChosen() {
                cells.choose()
            }
            else {
                cells.unChoose()
            }
        }
    }
    
    ///Stops game and displays victory-label
    func activateVictory() {
        let victoryLabel = UILabel(frame: CGRect(x: view.bounds.midX, y: view.bounds.midY, width: view.bounds.maxX/2, height: view.bounds.maxY/6))
        
        victoryLabel.text = "You win!"
        victoryLabel.textColor = UIColor.green
        victoryLabel.font.withSize(30)
        view.addSubview(victoryLabel)
    }
    
    ///Stops game and displays loss-label
    func activateLoss() {
        let lossLabel = UILabel(frame: CGRect(x: view.bounds.midX, y: view.bounds.midY, width: view.bounds.maxX/2, height: view.bounds.maxY/6))
        
        lossLabel.text = "You lose."
        lossLabel.textColor = UIColor.red
        lossLabel.font.withSize(30)
        view.addSubview(lossLabel)
    }
    
    //MARK: - Protocol overrides
    
    //How many cells
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return hand.count
    }
    
    
    //Individual cell setup
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //Gets cell object
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as! CardCollectionViewCell
        
        //Gets the cell index
        let card = hand[indexPath.row]
        
        //Sets cell image to Card objects image
        cell.setCard(card)
        
        cell.setIndex(index: indexPath.row)
        
        //Sets remaining card number in corner
        cell.addNumLabel(text: "4")
        
        //Flips to the front of the Card Cell
        cell.flip()
        
        return cell
    }

    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath) as! CardCollectionViewCell
        let card = cell.getCard()
        
        
        //Highlight cell and do turn
        if !cell.isFlipped() {
            model.chooseCard(card: card)
            doTurn()
        }
    }
}

