//
//  DetailViewController.swift
//  Final Project Draft
//
//  Created by Molly Soja on 12/1/19.
//  Copyright © 2019 Molly Soja. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import CoreLocation
import Foundation



class DetailViewController: UIViewController {

    var name: String!
    var rating: String!
    var priceLevel: String!
    var open: String!
    var data: String!
    var dollars = ""
    
        
    var restaurants = Restaurant()
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var ratingLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var openLabel: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = name
        ratingLabel.text = rating
        
        for _ in 0...(Int(priceLevel) ?? 1) - 1 {
            dollars += "$"
        }
        priceLabel.text = dollars
        if open == "true" {
            openLabel.text = "Yes"
        } else {
            openLabel.text = "No"
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let imageUrlString = "https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=\(data!)&key=AIzaSyBNLEdRbPUhG1rYAwZYfDo0p0MFRNytIfQ"
        //print(imageUrlString)
        let imageUrl:URL = URL(string: imageUrlString)!
        // Start background thread so that image loading does not make app unresponsive
         DispatchQueue.global(qos: .userInitiated).async {
            
            let imageData:NSData = NSData(contentsOf: imageUrl)!
            let imageView = UIImageView(frame: CGRect(x:100, y:446, width:300, height:300))
            //imageView.center = self.view.center
            imageView.center.x = self.view.center.x
            
            // When from background thread, UI needs to be updated on main_queue
           DispatchQueue.main.async {
                let image = UIImage(data: imageData as Data)
                imageView.image = image
                imageView.contentMode = UIView.ContentMode.scaleAspectFit
                self.view.addSubview(imageView)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

