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
    
    func roll(dice: Int){
        let result = Int.random(in: 1...4)
        resultLabel.text = "You rolled an \(dice) sidded dice and got a \(result)"
    }
    
    @IBAction func fourButton(_ sender: UIButton) {
        roll(dice: 4)
    }
    
    @IBAction func sixButton(_ sender: UIButton) {
        roll(dice: 6)
    }
    
    @IBAction func eightButton(_ sender: UIButton) {
        roll(dice: 8)
    }
    
    @IBAction func tenButton(_ sender: UIButton) {
        roll(dice: 10)
    }
    
    @IBAction func twelveButton(_ sender: Any) {
        roll(dice: 12)
    }
    
    @IBAction func twentyButton(_ sender: UIButton) {
        roll(dice: 20)
    }
    
    @IBAction func hundredButton(_ sender: UIButton) {
        roll(dice: 100)
    }
    
    
    
    
    
    
    
    
    
    
    
    


}

