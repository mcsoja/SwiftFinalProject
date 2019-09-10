//
//  ViewController.swift
//  Bip the Guy
//
//  Created by Molly Soja on 9/6/19.
//  Copyright © 2019 Molly Soja. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
  //properties
    @IBOutlet weak var imageToPunch: UIImageView!
    
    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    //Functions
    
    func animateImage(){
        let bounds = self.imageToPunch.bounds
        let shrinkValue: CGFloat = 60
        
        
        self.imageToPunch.bounds = CGRect(x: self.imageToPunch.bounds.origin.x + shrinkValue, y: self.imageToPunch.bounds.origin.y + shrinkValue, width: self.imageToPunch.bounds.size.width - shrinkValue, height: self.imageToPunch.bounds.size.height - shrinkValue)
        UIView.animate(withDuration: 0.25, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: [], animations: {self.imageToPunch.bounds = bounds}, completion: (nil))
    }
    
    func playSound(soundName: String, audioPlayer: inout AVAudioPlayer){
        //can we load sound?
        if let sound = NSDataAsset(name: soundName){
            //check if it's sound file
            do {
                try audioPlayer = AVAudioPlayer(data: sound.data)
                audioPlayer.play()
            }
            catch{ //if not a sound file
                print("ERROR in \(soundName) couldn't be played as a sound")
            }
        } else{
            print("ERROR: data in \(soundName) could not be played")
        }
    }
    
    //actions
    @IBAction func libraryPressed(_ sender: UIButton) {
    }
    @IBAction func cameraPressed(_ sender: UIButton) {
    }
    
    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
        animateImage()
        playSound(soundName: "punchSound", audioPlayer: &audioPlayer)
    }
    
}

