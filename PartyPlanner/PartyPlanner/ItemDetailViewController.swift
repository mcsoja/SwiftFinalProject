//
//  ItemDetailViewController.swift
//  PartyPlanner
//
//  Created by Molly Soja on 10/21/19.
//  Copyright © 2019 Molly Soja. All rights reserved.
//

import UIKit

class ItemDetailViewController: UIViewController {
    @IBOutlet weak var partyItemField: UITextField!
    @IBOutlet weak var personResponsibleField: UITextField!
    @IBOutlet weak var saveBarButton: UIBarButtonItem!
    
    var partyListItem: PartyListItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if partyListItem == nil {
            partyListItem = PartyListItem(partyItem: "", personResponsible: "")
        }
        
        partyItemField.text = partyListItem.partyItem
        personResponsibleField.text = partyListItem.personResponsible
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        partyListItem.partyItem = partyItemField.text!
        partyListItem.personResponsible = personResponsibleField.text!
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
