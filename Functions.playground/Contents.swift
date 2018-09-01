
//Creating the getMilk() function
//func getMilk() {
//    print("go to the shops")
//    print("buy 2 cartons of milk")
//    print("pay £2")
//    print("come home\n")
//}

//func getMilk(howManyMilkCartons : Int) {
//    var priceToPay : Int = 0
//    priceToPay = howManyMilkCartons * 2
//    print("go to the shops")
//    print("buy \(howManyMilkCartons) cartons of milk")
//    print("pay £2 for each")
//    print("the total of purchase is £\(priceToPay)")
//    print("come home\n")
//}

func getMilk(howManyMilkCartons : Int, howMuchMoneyRobatWasGiven : Int) -> Int {
    
    var priceToPay : Int = 0
    priceToPay = howManyMilkCartons * 2
    print("go to the shops")
    print("buy \(howManyMilkCartons) cartons of milk")
    print("pay £2")
    print("the total of purchase is £\(priceToPay)")
    print("come home\n")
    
    let change = howMuchMoneyRobatWasGiven - priceToPay
    
    return change
}

// Calling the getMilk() function
var amountOfChange = getMilk(howManyMilkCartons: 12, howMuchMoneyRobatWasGiven: 50)
print("Hello master, here's your £\(amountOfChange) change")

//getMilk(howManyMilkCartons: 4)














