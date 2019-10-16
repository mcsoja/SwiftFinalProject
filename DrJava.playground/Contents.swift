import UIKit

var str = "Hello, playground"

func TemperatureConversion(inputString: String){
    if let inputNumber = Double(inputString){
        let output = (inputNumber * (9.0/5.0)) + 32
        print("The current temperature is \(inputNumber) degree Celsuis, or \(output) degrees Fahrenheit")
    } else {
        print("Unconvertable: \"\(inputString)\" is not a valid number.")
    }
}

TemperatureConversion(inputString: "three")
