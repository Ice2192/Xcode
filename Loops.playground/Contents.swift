//: Playground - noun: a place where people can play

import UIKit

// for loop - Adding all numbers in array
//let arrayOfNumbers = [1,5,3,6,2,7,23,34]
//
//var sum = 0
//
//for number in arrayOfNumbers {
//    sum += number
//
//}
//
//print(sum)


// for loop that goes at a certain range
//// 1 ≤ number ≤ 10
//for number in 1...10 {
//    print(number)
//}
//
//// 1 ≤ number < 10
//for number in 1..<10 {
//    print(number)
//}


//for number in 1..<10 where number % 2 == 0{
//    print(number)
//}













// Decrementing for loop = 99 Bottles of beer

// First Way
//func beerSong() -> String {
//    var lyrics: String = ""
//
//    let bottlesOfBeer = 100
//
//    for number in 1...bottlesOfBeer-1 {
//        let newLine: String = "\(bottlesOfBeer - number) bottles of beer on the wall, \(bottlesOfBeer - number) bottles of beer.\nTake one down and pass it around, \(bottlesOfBeer-1 - number) bottles of beer on the wall.\n\n"
//        lyrics += newLine
//
//    }
//
//    lyrics += "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, 99 bottles of beer on the wall."
//
//    return lyrics
//}
//
//print(beerSong())

// Second Way (easier)
// Note this uses inputs to quickly and dynamically change the number of loop it runs
// and this also uses .reversed() to decrement the loop
func beerSong(_ totalNumberOfBottles: Int) -> String {      // the underscore lets the function call to simply put a number input rather than typing the whole parameter name
    var lyrics: String = ""
    
    for number in (1...totalNumberOfBottles).reversed() {
        let newLine: String = "\(number) bottles of beer on the wall, \(number) bottles of beer.\nTake one down and pass it around, \(number-1) bottles of beer on the wall.\n\n"
        lyrics += newLine   // add newLine to lyrics string
        
    }
    
    lyrics += "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, \(totalNumberOfBottles) bottles of beer on the wall."
    
    return lyrics
}

print(beerSong(21))





























