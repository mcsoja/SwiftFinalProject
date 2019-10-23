//
//  ItemDetailViewController.swift
//  PartyPlanner
//
//  Created by Molly Soja on 10/21/19.
//  Copyright © 2019 Molly Soja. All rights reserved.
//

import UIKit

class ItemDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func saveBarButtonPressed(_ sender: UIBarButtonItem) {
        
    }
    
    
    @IBAction func cancelBarButtonPressed(_ sender: UIBarButtonItem) {
        let isPresentingInAddMode = presentingViewController is UINavigationController
            if isPresentingInAddMode {
                dismiss(animated: true, completion: nil)
            } else {
                navigationController!.popViewController(animated: true)
            }
    }
    

}
