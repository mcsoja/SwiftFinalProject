//
//  ReviewTableViewController.swift
//  Snacktacular
//
//  Created by Molly Soja on 11/3/19.
//  Copyright © 2019 John Gallaugher. All rights reserved.
//

import UIKit

class ReviewTableViewController: UITableViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var postedByLabel: UILabel!
    @IBOutlet weak var reviewTitleLabel: UITextField!
    @IBOutlet weak var reviewView: UITextView!
    @IBOutlet weak var cancelBarButton: UIBarButtonItem!
    @IBOutlet weak var saveBarButton: UIBarButtonItem!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var buttonsBackgroundView: UIView!
    @IBOutlet weak var reviewDateLabel: UILabel!
    @IBOutlet var starButttonCollection: [UIButton]!
    
    var spot: Spot!
    var review: Review!
    
    var rating = 0 {
        didSet {
            for star in starButttonCollection {
                let image = UIImage.init(named: (star.tag < rating ? "star-filled" : "star-empty"))
                star.setImage(image, for: .normal)
                    
            }
            review.rating = rating
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:)))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
        
        guard let spot = spot else {
            return
        }
        nameLabel.text = spot.name
        addressLabel.text = spot.address
        
        if review == nil {
            review = Review()
        }
    }
    
    func leaveViewController () {
        let isPresentingInAddMode = presentingViewController is UINavigationController
        if isPresentingInAddMode {
            dismiss(animated: true, completion: nil)
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func starButtonPressed(_ sender: UIButton) {
        rating = sender.tag + 1
    }
    

    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        review.title = reviewTitleLabel.text!
        review.text = reviewView.text!
        review.saveData(spot: spot) { (success) in
            if success {
                self.leaveViewController()
            } else {
                print("ERROR save")
            }
        }
    }
    
    @IBAction func cancelButtonPresses(_ sender: UIBarButtonItem) {
        leaveViewController()
    }
    
    @IBAction func deleteButtonPressed(_ sender: UIButton) {
    }
    @IBAction func reviewTitleChanged(_ sender: UITextField) {
    }
    
    @IBAction func returnTitleDonePressed(_ sender: UITextField) {
    }
    
    
    
}
