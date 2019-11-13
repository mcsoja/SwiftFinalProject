//
//  PokeDetail.swift
//  Pokedex
//
//  Created by Molly Soja on 11/11/19.
//  Copyright © 2019 Molly Soja. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class PokeDetail {
    var name = ""
    var apiURL = ""
    var height = 0.0
    var weight = 0.0
    var imageURL = ""
    
    func getPokemon(completed: @escaping () -> ()) {
        Alamofire.request(apiURL).responseJSON { (response) in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                self.apiURL = json["next"].stringValue
                self.height = json["height"].doubleValue
                self.weight = json["weight"].doubleValue
                self.imageURL = json["sprites"]["front_default"].stringValue
            
            case .failure(let error):
                print("😐ERROR: failed to get data from url \(self.apiURL), error: \(error.localizedDescription)")
            }
            completed()
        }
    }
}

