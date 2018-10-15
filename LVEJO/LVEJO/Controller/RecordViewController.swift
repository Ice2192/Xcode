//
//  RecordViewController.swift
//  LVEJO
//
//  Created by Kevin Alonzo on 9/26/18.
//  Copyright © 2018 Kevin Alonzo. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class RecordViewController: UIViewController {

    // Record Count Labels
    @IBOutlet weak var truckCount: UILabel!
    @IBOutlet weak var peopleChildCount: UILabel!
    @IBOutlet weak var peopleYouthCount: UILabel!
    @IBOutlet weak var peopleAdultCount: UILabel!
    @IBOutlet weak var peopleSeniorCount: UILabel!
    @IBOutlet weak var bicyclistsChildCount: UILabel!
    @IBOutlet weak var bicyclistsYouthCount: UILabel!
    @IBOutlet weak var bicyclistsAdultCount: UILabel!
    @IBOutlet weak var bicyclistsSeniorCount: UILabel!
    
    // Stepper
    // Hitting the plus/minus buttons will change the
    // count value of the item.
    
    //TODO: TRUCK COUNT
    @IBAction func truckStepper(_ sender: UIStepper) {
        var truckNum = 0
        truckNum = Int(sender.value)
        truckCount.text = String(truckNum)
    }
    
    //TODO: PEOPLE COUNT
    @IBAction func peopleChildStepper(_ sender: UIStepper) {
        var peopleChildNum = 0
        peopleChildNum = Int(sender.value)
        peopleChildCount.text = String(peopleChildNum)
    }
    @IBAction func peopleYouthStepper(_ sender: UIStepper) {
        var peopleYouthNum = 0
        peopleYouthNum = Int(sender.value)
        peopleYouthCount.text = String(peopleYouthNum)
    }
    @IBAction func peopleAdultStepper(_ sender: UIStepper) {
        var peopleAdultNum = 0
        peopleAdultNum = Int(sender.value)
        peopleAdultCount.text = String(peopleAdultNum)
    }
    @IBAction func peopleSeniorStepper(_ sender: UIStepper) {
        var peopleSeniorNum = 0
        peopleSeniorNum = Int(sender.value)
        peopleSeniorCount.text = String(peopleSeniorNum)
    }
    
    
    //TODO: BYCYCLISTS COUNT
    @IBAction func bicyclistsChildStepper(_ sender: UIStepper) {
        var bicyclistsChildNum = 0
        bicyclistsChildNum = Int(sender.value)
        bicyclistsChildCount.text = String(bicyclistsChildNum)
    }
    @IBAction func bicyclistsYouthStepper(_ sender: UIStepper) {
        var bicyclistsYouthNum = 0
        bicyclistsYouthNum = Int(sender.value)
        bicyclistsYouthCount.text = String(bicyclistsYouthNum)
    }
    @IBAction func bicyclistsAdultStepper(_ sender: UIStepper) {
        var bicyclistsAdultNum = 0
        bicyclistsAdultNum = Int(sender.value)
        bicyclistsAdultCount.text = String(bicyclistsAdultNum)
    }
    @IBAction func bicyclistsSeniorStepper(_ sender: UIStepper) {
        var bicyclistsSeniorNum = 0
        bicyclistsSeniorNum = Int(sender.value)
        bicyclistsSeniorCount.text = String(bicyclistsSeniorNum)
    }
    
    // Smell Dropdown
    
    @IBOutlet weak var smellDropdown: UIPickerView!
    
    var smellList = ["Light", "Moderate", "Intense"]
    
    // Submit Button
    @IBAction func Submit(_ sender: Any) {
        print("Truck Count: ", truckCount as Any)       // test - remove when done
        
        //TODO: GET DATE & TIME
        
        //TODO: GET GPS
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sign Out", style: .done, target: self, action: #selector(logOutPressed))
    }
    
    // Log Out
    
    @objc func logOutPressed() {
        do {
            try Auth.auth().signOut()
            let welcomeViewController = WelcomeViewController()
            let welcomeViewNavigationController = UINavigationController(rootViewController: welcomeViewController)
            self.present(welcomeViewNavigationController, animated: true, completion: nil)
            
            
            
        } catch let err {
            print(err)
        }
        
        
        
            
    }
}
