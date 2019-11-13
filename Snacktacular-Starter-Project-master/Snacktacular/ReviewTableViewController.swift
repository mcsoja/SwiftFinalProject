//
//  ReviewTableViewController.swift
//  Snacktacular
//
//  Created by Molly Soja on 11/3/19.
//  Copyright © 2019 John Gallaugher. All rights reserved.
//

import UIKit
import Firebase

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
    @IBOutlet var starButtonCollection: [UIButton]!
    
    var spot: Spot!
    var review: Review!
    let dateFormatter = DateFormatter()
    
    var rating = 0 {
        didSet {
            for star in starButtonCollection {
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
        
        guard spot != nil else {
            return
        }
        
        if review == nil {
            review = Review()
        }
        updateUserInterface()
    }
    
    func updateUserInterface() {
        nameLabel.text = spot.name
        addressLabel.text = spot.address
        rating = review.rating
        reviewTitleLabel.text = review.title
        enableDisableSaveButton()
        reviewView.text = review.text
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        reviewDateLabel.text = "posted: \(dateFormatter.string(from: review.date))"
        if review.documentID == "" {
            addBordersToEditableObjects()
        } else {
            if review.reviewUserID == Auth.auth().currentUser?.email {
                self.navigationItem.leftItemsSupplementBackButton = false
                self.saveBarButton.title = "Update"
                addBordersToEditableObjects()
                deleteButton.isHidden = false
            } else {
                cancelBarButton.title = ""
                saveBarButton.title = ""
                postedByLabel.text = "Posted by: \(review.reviewUserID)"
                for star in starButtonCollection {
                    star.backgroundColor = UIColor.white
                    star.adjustsImageWhenDisabled = false
                    star.isEnabled = false
                    reviewTitleLabel.isEnabled = false
                    reviewView.isEditable = false
                    reviewTitleLabel.backgroundColor = UIColor.white
                    reviewView.backgroundColor = UIColor.white
                }
                
            }
        }
    }
    
    func addBordersToEditableObjects() {
        reviewTitleLabel.addBorder(width: 0.5, radius: 5.0, color: .black)
        reviewView.addBorder(width: 0.5, radius: 5.0, color: .black)
        buttonsBackgroundView.addBorder(width: 0.5, radius: 5.0, color: .black)
    }
    
    func enableDisableSaveButton() {
        if reviewTitleLabel.text != "" {
            saveBarButton.isEnabled = true
        } else {
            saveBarButton.isEnabled = false
        }
    }
    
    func saveThenSegue() {
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
        saveThenSegue()
    }
    
    @IBAction func cancelButtonPresses(_ sender: UIBarButtonItem) {
        leaveViewController()
    }
    
    @IBAction func deleteButtonPressed(_ sender: UIButton) {
        review.deleteData(spot: spot) { (success) in
            if success {
                self.leaveViewController()
            } else {
                print("ERROR: delete unsuccessful")
            }
        }
    }
    @IBAction func reviewTitleChanged(_ sender: UITextField) {
        enableDisableSaveButton()
    }
    
    @IBAction func returnTitleDonePressed(_ sender: UITextField) {
        saveThenSegue()
    }
    
    
    
}
