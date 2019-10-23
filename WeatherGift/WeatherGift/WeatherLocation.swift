//
//  WeatherLocation.swift
//  WeatherGift
//
//  Created by Molly Soja on 10/23/19.
//  Copyright © 2019 Molly Soja. All rights reserved.
//

import Foundation

class WeatherLocation: Codable {
    
    var name: String
    var coordinates: String
    
    init(name: String, coordinates: String){
        self.name = name
        self.coordinates = coordinates
    }
    
}
