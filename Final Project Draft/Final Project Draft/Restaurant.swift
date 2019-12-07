//
//  Restaurant.swift
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


class Restaurant {
    var open: String!
    var data: String!
    var name: String!
    var rating: String!
    var priceLevel: String!
    var apiURL: String!
    var numberOfRestaurants: Int!
    
    var restaurantArray = [RestaurantData]()
    
    func getRestaurants(completed: @escaping () -> ()) {
        //print("real \(self.apiURL)")
        Alamofire.request(self.apiURL).responseJSON { response in
            switch response.result {
            case .success (let value):
                let json = JSON(value)
                self.numberOfRestaurants = json["results"].count
                if self.numberOfRestaurants ==  0 {
                    let name = "No restaurants found"
                    let rating = ""
                    let priceLevel = ""
                    let open = ""
                    let data = ""
                    let new = RestaurantData(name: name, rating: rating, priceLevel: priceLevel, open: open, data: data)
                    self.restaurantArray.append(new)
                } else {
                    for index in 0...self.numberOfRestaurants - 1 {
                        let name = json["results"][index]["name"].stringValue
                        let rating = json["results"][index]["rating"].stringValue
                        let priceLevel = json["results"][index]["price_level"].stringValue
                        let open = json["results"][index]["opening_hours"]["open_now"].stringValue
                        let data = json["results"][index]["photos"][0]["photo_reference"].stringValue
                        //print("DATA \(data)")
                        let new = RestaurantData(name: name, rating: rating, priceLevel: priceLevel, open: open, data: data)
                        self.restaurantArray.append(new)
                    }
                }
            case .failure (let error):
                print("error \(error)")
            }
        completed()
        }
    }
}
