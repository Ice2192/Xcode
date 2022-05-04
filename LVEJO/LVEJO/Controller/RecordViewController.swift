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
import MapKit

class RecordViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, CLLocationManagerDelegate {
    
     let locationManager = CLLocationManager() // Requests Acess to the Location E.K.

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
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var gpsLabel: UILabel!
    
    var ref:DatabaseReference?
    
    // Get name, email, and phone
    var name = String()
    var email = String()
    var phone = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateLabel.isHidden = true
        timeLabel.isHidden = true
        gpsLabel.isHidden = true
        
        ref = Database.database().reference()
        
        // Save strings from LogInViewController
        //var userEmail = email
        //var userName = name
        //var userPhone = phone
        
        
        
        // Location .... E.K.
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
        
        //navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sign Out", style: .done, target: self, action: #selector(logOutPressed))
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
        let location = locations[0]
        
        let span:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        let region:MKCoordinateRegion = MKCoordinateRegion(center: myLocation, span: span)
        
        if let location = locations.first {
            print(location.coordinate)
        }
        
        CLGeocoder().reverseGeocodeLocation(location) { (placemark, error) in
            if error != nil {
                print("There was an error")
            }
            else {
                if let place = placemark?[0] {
                    self.gpsLabel.text = "\(place.thoroughfare)"
                }
                
            }
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
        let fullDate = day + month + year
        // Check if it works
        print("\(month):\(day):\(year)")
        
        dateLabel.text = "\(month)/\(day)/\(year)"
        timeLabel.text = "\(hour):\(minutes):\(seconds)"
        
        // Save data to Firebase
        let results = Database.database().reference().child("userResults").childByAutoId()
        
        self.ref?.child("User Results").childByAutoId().setValue([
                                                  "Email": self.email,
                                                  "Name": self.name,
                                                  "Phone": self.phone,
                                                  "Trucks": self.truckCount.text!,
                                                  "People (Child)": self.peopleChildCount.text!,
                                                  "People (Youth)": self.peopleYouthCount.text!,
                                                  "People (Adult)": self.peopleAdultCount.text!,
                                                  "People (Senior)": self.peopleSeniorCount.text!,
                                                  "Bicyclists (Child)": self.bicyclistsChildCount.text!,
                                                  "Bicyclists (Youth)": self.bicyclistsYouthCount.text!,
                                                  "Bicyclists (Adult)": self.bicyclistsAdultCount.text!,
                                                  "Bicyclists (Senior)": self.bicyclistsSeniorCount.text!,
                                                  "Smell Indesnity": self.smellLabel.text!,
                                                  "Date": self.dateLabel.text!,
                                                  "Time": self.timeLabel.text!,
                                                  "Location": self.gpsLabel.text!
            
           
        ])

        //TODO: GET GPS // Done by Elaine Khor 28th Nov 2018
       // var locationManager = CLLocationManager()
      //  @IBOutlet weak var map: MKMapView!
        
       // override func viewDidLoad() {
      //      super.viewDidLoad()
          //  self.locationManager.requestWhenInUseAuthorization()
            
          //  if CLLocationManager.locationServicesEnabled() {
                
            //    locationManager.delegate = self
            //    locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
             //   locationManager.startUpdatingLocation()
         //   }
            
       // }
        
       // override func didReceiveMemoryWarning() {
         //   super.didReceiveMemoryWarning()
            // disposes of any resources that can be recreated
      //  }
        
      //  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
      //  {

          //  let locValue: CLLocationCoordinate2D = manager.location!.coordinate
          //  print("locations = \(locValue.latitude) \(locValue.longitude)")
         //   let userLocation = locations.last
          //  let viewRegion = MKCoordinateRegionMakeWithDistance((userLocation?.coordinate)!, 600, 600)
          //  self.map.setRegion (viewRegion, animated: true)
            // not inlcuding this code due to only being able to see the the location through the app
        // instead we are just having GPS coordinates be spit out on FireBase
        // }
        
        //For use when the app is open & in the background
        locationManager.requestAlwaysAuthorization()
        
        //For use when the app is open
        //locationManager.requestWhenInUseAuthorization()
        

        
        
            
    }
}

