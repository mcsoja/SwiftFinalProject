//
//  DetailViewController.swift
//  
//
//  Created by Molly Soja on 11/11/19.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var pokemonImage: UIImageView!
    
    var pokeData: PokeData!
    var pokeDetail = PokeDetail()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if pokeData == nil {
            pokeData = PokeData(name: "", url: "")
        }
        nameLabel.text = pokeData.name
        pokeDetail.name = pokeData.name
        pokeDetail.apiURL = pokeData.url
        
        pokeDetail.getPokemon {
            self.updateUserInterface()
        }
        // Do any additional setup after loading the view.
    }
    
    func updateUserInterface() {
        self.heightLabel.text = "\(self.pokeDetail.height)"
        self.weightLabel.text = "\(self.pokeDetail.weight)"
        
        guard let url = URL(string: pokeDetail.imageURL) else {
            return
        }
        do {
            let data = try Data(contentsOf: url)
            pokemonImage.image = UIImage(data: data)
        } catch {
            print("Erorr thrown trying to get image from url \(url)")
        }
    }
}
