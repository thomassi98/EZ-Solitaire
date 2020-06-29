//
//  ViewController.swift
//  EZ Solitaire
//
//  Created by Thomas Solberg Irgens on 22/06/2020.
//  Copyright © 2020 Thomas S. Irgens. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private var model = GameModel()
    private var deck = [Card]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Get cards
        deck = model.getDeck()
        
        //Keep track
    }


}

