//
//  WeatherLocation.swift
//  WeatherGift
//
//  Created by Molly Soja on 10/16/19.
//  Copyright © 2019 Molly Soja. All rights reserved.
//

import Foundation
import Alamofire

class WeatherLocation {
    var name = ""
    var coordinates = ""
    
    func getWeather(){
        let weatherURL = urlBase + urlAPIKey + coordinates
        print(weatherURL)
        Alamofire.request(weatherURL).responseJSON { response in
            print(response)
        }
    }
}
