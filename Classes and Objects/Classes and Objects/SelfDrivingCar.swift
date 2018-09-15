//
//  SelfDrivingCar.swift
//  Classes and Objects
//
//  Created by Kevin Alonzo on 9/14/18.
//  Copyright © 2018 Kevin Alonzo. All rights reserved.
//

import Foundation

class SelfDrivingCar : Car {
    
    var destination : String = "1 Infinite Loop"
    
    override func drive() {
        super.drive()
        
        print("Driving towards destination: " + destination)
        
    }
    
}
