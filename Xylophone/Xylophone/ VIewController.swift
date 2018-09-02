//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 27/01/2016.
//  Copyright © 2016 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }



    @IBAction func notePressed(_ sender: UIButton) {
        
        print(sender.tag)
        
        if sender.tag == 1 {
            print("play middle C")
        }
        else if sender.tag == 2 {
            print("play D")
        }
        
    }
    
  

}

