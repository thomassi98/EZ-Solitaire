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
        
        //Width and height specifications
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
            
            //Attempts to fetch new Card from models deck, flips cell if none found
            if cells.getCard().isMatched() {
                do {
                    try cells.setCard(model.dealCard())
                }
                catch {
                    if !cells.isFlipped() {
                    cells.flipBack()
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

    //MARK: - Protocol overrides
    
    //How many cells
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return hand.count
    }
    
    //Which cells
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //Gets cell object
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as! CardCollectionViewCell
        
        //Gets the corresponding Card object
        let card = hand[indexPath.row]
        
        //Sets cell image to Card objects image
        cell.setCard(card)
        
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

