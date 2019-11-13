//
//  Pokemon.swift
//  Pokedex
//
//  Created by Molly Soja on 11/4/19.
//  Copyright © 2019 Molly Soja. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class Pokemon {
    
    var pokeArray = [PokeData]()
    var totalPokemon = 0
    var apiURL = "https://pokeapi.co/api/v2/pokemon"
    
    func getPokemon(completed: @escaping () -> ()) {
        Alamofire.request(apiURL).responseJSON { (response) in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                self.apiURL = json["next"].stringValue
                self.totalPokemon = json["count"].intValue
                let numberOfPokemon = json["results"].count
                for index in 0...numberOfPokemon-1 {
                    let name = json["results"][index]["name"].stringValue
                    let url = json["results"][index]["url"].stringValue
                    self.pokeArray.append(PokeData(name: name, url: url))
                }
            case .failure(let error):
                print("😐ERROR: failed to get data from url \(self.apiURL), error: \(error.localizedDescription)")
            }
            completed()
        }
    }
    
}
