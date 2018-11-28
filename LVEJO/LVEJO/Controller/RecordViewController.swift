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
import FirebaseDatabase
import CoreLocation

class RecordViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, CLLocationManagerDelegate {

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
    
    let locationManager = CLLocationManager()
    
    var ref:DatabaseReference?
    
    // Get name, email, and phone
    var name = String()
    var email = String()
    var phone = String()
    
    var timer = Timer()
    var minutes = 0
    var seconds = 0
    var isRunning = false
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBAction func startTimer(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    // Timer
    @objc func updateTimer() {
        if seconds == 60 {
            minutes += 1
            seconds = 0
        }
        timerLabel.text = "\(minutes):\(seconds)"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        
        // Save strings from LogInViewController
        var userEmail = email
        var userName = name
        var userPhone = phone
        
        
        
        // Location
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
            locationManager.startUpdatingLocation()
        }
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sign Out", style: .done, target: self, action: #selector(logOutPressed))
    }
    
    // Recorded pop-up
    func errorAlert(title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            print(location.coordinate)
        }
    }

    
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
    
    
    //TODO: BICYCLISTS COUNT
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
    
    // Smell Intensity
    @IBOutlet weak var smellLabel: UILabel!
    @IBOutlet weak var smellPickerView: UIPickerView!
    
    let smell = ["Light", "Moderate", "Intense"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return smell[row]
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return smell.count
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        smellLabel.text = smell[row]
    }
    
    // Submit Button
    @IBAction func Submit(_ sender: Any) {
        
        self.errorAlert(title: "Success!", message: "Log Session Recorded!")
        
        //DATE & TIME
        let date = Date()
        let calendar = Calendar.current
        
        // Capture Time
        let hour = calendar.component(.hour, from: date)
        let minutes = calendar.component(.minute, from: date)
        let seconds = calendar.component(.second, from: date)
        // Check if it works
        print("\(hour):\(minutes):\(seconds)")
        
        // Capture Date
        let day = calendar.component(.day, from: date)
        let month = calendar.component(.month, from: date)
        let year = calendar.component(.year, from: date)
        // Check if it works
        print("\(month):\(day):\(year)")
        
        /*
         User1
            Name
            E-mail
            Phone Number
            Date/Time
            GPS Coordinates
            Truck Counts
            People (Child)
            People (Youth)
            People (Adult)
            People (Senior)
            Bicyclists (Child)
            Bicyclists (Youth)
            Bicyclists (Adult)
            Bicyclists (Senior)
            Smell Intensity
         
         User2
            Name
            E-mail
            Phone Number
            ...
         */
        
        // Save data to Firebase
        let results = Database.database().reference().child("userResults").childByAutoId()
        
        self.ref?.child("User Results").childByAutoId().setValue([
                                                  "Email": self.email,
                                                  "Name": self.name,
                                                  "Phone": self.phone,
                                                  "Truck Count": self.truckCount.text!,
                                                  "People (Child)": self.peopleChildCount.text!,
                                                  "People (Youth)": self.peopleYouthCount.text!,
                                                  "People (Adult)": self.peopleAdultCount.text!,
                                                  "People (Senior)": self.peopleSeniorCount.text!,
                                                  "Bicyclists (Child)": self.bicyclistsChildCount.text!,
                                                  "Bicyclists (Youth)": self.bicyclistsYouthCount.text!,
                                                  "Bicyclists (Adult)": self.bicyclistsAdultCount.text!,
                                                  "Bicyclists (Senior)": self.bicyclistsSeniorCount.text!,
                                                  "Smell Indesnity": self.smellLabel.text!
        ])

        //TODO: GET GPS
        locationManager.stopUpdatingLocation()
    }
    
    // Log Out - FIX THIS!!!!
    
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
