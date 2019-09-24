//
//  ViewController.swift
//  DungeonDice
//
//  Created by Molly Soja on 9/16/19.
//  Copyright © 2019 Molly Soja. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        let result = Int.random(in: 1...sender.tag)
        resultLabel.text = "You rolled an \(sender.tag) sidded dice and got a \(result)"
    }
    


}

