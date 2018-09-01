//: Playground - noun: a place where people can play

import UIKit

// Metric
func calculatorBMI(mass : Double, height : Double) -> String {

    let BMI = mass / pow(height, 2)
    let shortBMI = String(format: "%.2f", BMI)
    
    var interpretation = ""
    
    if BMI > 25 {
        interpretation = "hit the gym FATTY!!!"
    }
    else if BMI > 18.5 {
        interpretation = "you are of normal weight."
    }
    else {
        interpretation = "eat a sandwich TWIG!!!!"
    }

    return "Your BMI is \(shortBMI) and \(interpretation)"
}

print("Metric")
var bmiResult = calculatorBMI(mass: 81.6466, height: 1.7272)
print(bmiResult)

print("")

// Imperial
func imperialBMI(weight : Double, height : Double) -> String {
    
    let BMI = (weight * 703) / pow(height, 2)
    let shortBMI = String(format: "%.2f", BMI)
    
    var interp = ""
    
    if BMI > 25 {
        interp = "hit the gym FATTY!!!"
    }
    else if BMI > 18.5 {
        interp = "you are of normal weight."
    }
    else {
        interp = "eat a sandwich TWIG!!!!"
    }
    
    return "Your BMI is \(shortBMI) and \(interp)"
    
}

var bmiImperialResult = imperialBMI(weight: 180, height: 68)
print("Imperial")
print(bmiImperialResult)
