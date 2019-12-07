//
//  SuggestionViewController.swift
//  Final Project Draft
//
//  Created by Molly Soja on 11/20/19.
//  Copyright © 2019 Molly Soja. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import CoreLocation

//var latitude: Double!
//var longitude: Double!
//var apiURL = ""

class SuggestionViewController: UIViewController {
    var name: String!
    var rating: String!
    var priceLevel: String!
    var locationManager: CLLocationManager!
    var currentLocation: CLLocation!
    var word = "sushi"
    
    
    @IBOutlet weak var nameLabel1: UILabel!
    @IBOutlet weak var nameLabel2: UILabel!
    @IBOutlet weak var nameLabel3: UILabel!
    @IBOutlet weak var nameLabel4: UILabel!
    
    @IBOutlet weak var ratingLabel1: UILabel!
    @IBOutlet weak var ratingLabel2: UILabel!
    @IBOutlet weak var ratingLabel3: UILabel!
    @IBOutlet weak var ratingLabel4: UILabel!
    
    @IBOutlet weak var priceLabel1: UILabel!
    @IBOutlet weak var priceLabel2: UILabel!
    @IBOutlet weak var priceLabel3: UILabel!
    @IBOutlet weak var priceLabel4: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getLocation()
    }
    
    func getSuggestions() {
            Alamofire.request(apiURL).responseJSON { response in
            switch response.result {
            case .success (let value):
                let json = JSON(value)
                self.nameLabel1.text = json["results"][0]["name"].stringValue
                self.ratingLabel1.text = "Rating: \(json["results"][0]["rating"].stringValue)"
                let price1 = json["results"][0]["price_level"].stringValue
                var price1Text = ""
                for _ in 0...(Int(price1) ?? 1) - 1 {
                    price1Text += "$"
                }
                self.priceLabel1.text = "Price Level: \(price1Text)"
                self.nameLabel2.text = json["results"][1]["name"].stringValue
                self.ratingLabel2.text = "Rating: \(json["results"][1]["rating"].stringValue)"
                let price2 = json["results"][1]["price_level"].stringValue
                var price2Text = ""
                for _ in 0...(Int(price2) ?? 1) - 1 {
                    price2Text += "$"
                }
                self.priceLabel2.text = "Price Level: \(price2Text)"
                self.nameLabel3.text = json["results"][2]["name"].stringValue
                self.ratingLabel3.text = "Rating: \(json["results"][2]["rating"].stringValue)"
                let price3 = json["results"][2]["price_level"].stringValue
                var price3Text = ""
                for _ in 0...(Int(price3) ?? 1) - 1 {
                    price3Text += "$"
                }
                self.priceLabel3.text = "Price Level: \(price3Text)"
                self.nameLabel4.text = json["results"][3]["name"].stringValue
                self.ratingLabel4.text = "Rating: \(json["results"][3]["rating"].stringValue)"
                let price4 = json["results"][3]["price_level"].stringValue
                var price4Text = ""
                for _ in 0...(Int(price4) ?? 1) - 1 {
                    price4Text += "$"
                }
                self.priceLabel4.text = "Price Level: \(price4Text)"
            case .failure (let error):
                print("error \(error)")
            }
        }
    }

}

extension SuggestionViewController: CLLocationManagerDelegate{
    
    func getLocation() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        print(apiURL)
    }
    
    func handleLocationAuthorizationStatus(status: CLAuthorizationStatus) {
        switch status{
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .authorizedAlways, .authorizedWhenInUse:
            locationManager.requestLocation()
        case .denied:
            print("Sorry can't show location user has not authorized it")
        case .restricted:
            print("Access denied, currently location controls are restricting location services")
        default:
            print("default")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        handleLocationAuthorizationStatus(status: status)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        currentLocation = locations.last
        latitude = currentLocation.coordinate.longitude
        longitude = currentLocation.coordinate.latitude
        print("Current Locaiton is \(currentLocation.coordinate.latitude), \(currentLocation.coordinate.longitude)")
        apiURL = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=\(longitude!),\(latitude!)&radius=1500&type=restaurant&keyword=\(word)&key=AIzaSyBNLEdRbPUhG1rYAwZYfDo0p0MFRNytIfQ"
        print(apiURL)
        getSuggestions()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to get use location")
    }
}
