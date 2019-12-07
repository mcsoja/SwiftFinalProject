//
//  ListViewController.swift
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



class ListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var restaurants = Restaurant()
    var locationManager: CLLocationManager!
    var currentLocation: CLLocation!
    var word: String!
    var apiURL: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.restaurants.apiURL = self.apiURL
        restaurants.getRestaurants {
            self.tableView.reloadData()
        }
    }
    

}


extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.restaurantArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = restaurants.restaurantArray[indexPath.row].name
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetail" {
            let destination = segue.destination as! DetailViewController
            let selectedIndexPath = tableView.indexPathForSelectedRow!
            destination.name = restaurants.restaurantArray[selectedIndexPath.row].name
            destination.rating = restaurants.restaurantArray[selectedIndexPath.row].rating
            destination.priceLevel = restaurants.restaurantArray[selectedIndexPath.row].priceLevel
            destination.open = restaurants.restaurantArray[selectedIndexPath.row].open
            destination.data = restaurants.restaurantArray[selectedIndexPath.row].data
        }
    }
}

