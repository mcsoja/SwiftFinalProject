//
//  StudentDetailViewController.swift
//  StudentList
//
//  Created by Molly Soja on 10/21/19.
//  Copyright © 2019 Molly Soja. All rights reserved.
//

import UIKit

class StudentDetailViewController: UIViewController {
    
    @IBOutlet weak var studentNameField: UITextField!
    
    var student: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if student == nil {
            student  = ""
        }
        
        studentNameField.text = student
        // Do any additional setup after loading the view.
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    @IBAction func cancelBarButtonPressed(_ sender: UIBarButtonItem) { //SHEET CODE
        let isPresentingInAddMode = presentingViewController is UINavigationController
        if isPresentingInAddMode {
            dismiss(animated: true, completion: nil)
        } else {
            navigationController!.popViewController(animated: true)
        }
    }

}
