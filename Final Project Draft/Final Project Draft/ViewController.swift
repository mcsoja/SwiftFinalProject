//
//  ViewController.swift
//  Final Project Draft
//
//  Created by Molly Soja on 11/12/19.
//  Copyright © 2019 Molly Soja. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import CoreLocation
import Foundation

var latitude: Double!
var longitude: Double!
var apiURL = ""

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var wheelImageView: UIImageView!
    
    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    @IBOutlet weak var thirdTextField: UITextField!
    @IBOutlet weak var fourthTextField: UITextField!
    
    @IBOutlet weak var wheelView: UIView!
    @IBOutlet weak var spinButton: UIButton!
    
    
    var rotationAmount = Double.pi / 4
    var rotateTimes = Int.random(in: 4...20)
    var done = 0
    var locationManager: CLLocationManager!
    var currentLocation: CLLocation!
    var word = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        firstTextField.delegate = self
        secondTextField.delegate = self
        thirdTextField.delegate = self
        fourthTextField.delegate = self
            
    }
    
    func rotate() {
        UIView.animate(withDuration: 3.0, delay: 1.0, options: .curveLinear, animations: {
            self.wheelView.transform = self.wheelView.transform.rotated(by: CGFloat(self.rotationAmount))
        })
    }
    
    func resetWheel() {
        UIView.animate(withDuration: 3.0, delay: 1.0, options: .curveLinear, animations: {
            self.wheelView.transform = self.wheelView.transform.rotated(by: -CGFloat(self.rotationAmount))
        })
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    @IBAction func spinButtonPressed(_ sender: UIButton) {
        if spinButton.titleLabel!.text == "Spin!" {
            let numberArray = [9,11,13,15,17,19,21,23]
            rotateTimes = numberArray.randomElement()!
            //print(rotateTimes)
            for _ in 0...rotateTimes {
                rotate()
            }
            if rotateTimes == 9 || rotateTimes == 17{
                word = firstTextField.text!
            } else if rotateTimes == 11 || rotateTimes == 19{
                word = secondTextField.text!
            } else if rotateTimes == 13 || rotateTimes == 21{
                word = thirdTextField.text!
            } else if rotateTimes == 15 || rotateTimes == 23{
                word = fourthTextField.text!
            }
            getLocation()
            spinButton.setTitle("See Suggestions", for: .normal)
        } else {
            performSegue(withIdentifier: "Suggestion", sender: nil)
            spinButton.setTitle("Spin!", for: .normal)
            for _ in 0...rotateTimes {
                resetWheel()
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Suggestion" {
            //print("apiURL \(apiURL)")
            let destination = segue.destination as! ListViewController
            destination.word = word
            destination.apiURL = apiURL
        } else {
            print("No segue")
            }
    }
    
}


extension ViewController: CLLocationManagerDelegate{
    
    func getLocation() {
        locationManager = CLLocationManager()
        locationManager.delegate = self
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
        apiURL = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=\(longitude!),\(latitude!)&radius=5000&type=restaurant&keyword=\(word)&key=AIzaSyBNLEdRbPUhG1rYAwZYfDo0p0MFRNytIfQ"
        //print(apiURL)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to get use location")
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
            tap.cancelsTouchesInView = false
            view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
