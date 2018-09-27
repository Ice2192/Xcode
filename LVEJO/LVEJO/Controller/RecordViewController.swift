//
//  RecordViewController.swift
//  LVEJO
//
//  Created by Kevin Alonzo on 9/26/18.
//  Copyright © 2018 Kevin Alonzo. All rights reserved.
//

import UIKit

class RecordViewController: UIViewController {

    // Record Count Labels
    @IBOutlet weak var truckCount: UILabel!
    @IBOutlet weak var peopleCount: UILabel!
    @IBOutlet weak var bicyclistsCount: UILabel!
    @IBOutlet weak var smallCount: UILabel!
    
    
    // Stepper
    // Hitting the plus and minus buttons will change the
    // count value of the item.
    @IBAction func truckStepper(_ sender: UIStepper) {
        var truckNum = 0
        truckNum = Int(sender.value)
        truckCount.text = String(truckNum)
    }
    @IBAction func peopleStepper(_ sender: UIStepper) {
        var peopleNum = 0
        peopleNum = Int(sender.value)
        peopleCount.text = String(peopleNum)
    }
    @IBAction func bicyclistsStepper(_ sender: UIStepper) {
        var bicyclistsNum = 0
        bicyclistsNum = Int(sender.value)
        bicyclistsCount.text = String(bicyclistsNum)
    }
    @IBAction func smellStepper(_ sender: UIStepper) {
        var smellNum = 0
        smellNum = Int(sender.value)
        smallCount.text = String(smellNum)
    }
    
    
    // Date & Time
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    


}