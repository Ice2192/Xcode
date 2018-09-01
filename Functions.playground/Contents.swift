
//Creating the getMilk() function
//func getMilk() {
//    print("go to the shops")
//    print("buy 2 cartons of milk")
//    print("pay $2")
//    print("come home\n")
//}

func getMilk(howManyMilkCartons : Int) {
    var total : Int = 0
    total = howManyMilkCartons * 2
    print("go to the shops")
    print("buy \(howManyMilkCartons) cartons of milk")
    print("pay $2")
    print("come home\n")
}

// Calling the getMilk() function
getMilk(howManyMilkCartons: 4)
getMilk(howManyMilkCartons: 1)
getMilk(howManyMilkCartons: 12)
