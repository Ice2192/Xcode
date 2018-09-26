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
    @IBAction func truckStepper(_ sender: UIStepper) {
        truckCount.text = String(sender.value)
    }
    @IBAction func peopleStepper(_ sender: UIStepper) {
        peopleCount.text = String(sender.value)
    }
    @IBAction func bicyclistsStepper(_ sender: UIStepper) {
        bicyclistsCount.text = String(sender.value)
    }
    @IBAction func smellStepper(_ sender: UIStepper) {
        smallCount.text = String(sender.value)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


}
