//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Kevin Alonzo on 8/31/18.
//  Copyright © 2018 Kevin Alonzo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var randomBallIndex : Int = 0
    
    let ballArrary = ["ball1", "ball2", "ball3", "ball4", "ball5"]
    
    // Image view of the ball
    @IBOutlet weak var ballImageView: UIImageView!
    
    // Function to change the 8 Ball image
    func updateBallImages(){
        randomBallIndex = Int(arc4random_uniform(5))
        ballImageView.image = UIImage(named: ballArrary[randomBallIndex])
    }
    
    // Load
    override func viewDidLoad() {
        super.viewDidLoad()
        updateBallImages()
    }

    // Change image via "Ask" button
    @IBAction func askButtonPressed(_ sender: UIButton) {
        updateBallImages()
    }
    
    // Change image via iPhone shake
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        updateBallImages()
    }
    
    // Memory Warning
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

