//
//  SelfDrivingCar.swift
//  Classes and Objects
//
//  Created by Kevin Alonzo on 9/14/18.
//  Copyright © 2018 Kevin Alonzo. All rights reserved.
//

import Foundation

class SelfDrivingCar : Car {
    
    var destination : String?
    
    override func drive() {
        super.drive()
        
        if let userSetDestination = destination {
            
            print("Driving towards destination: " + userSetDestination)
            
        }
        
    }
    
}
