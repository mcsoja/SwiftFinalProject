import UIKit

var str = "Hello, playground"


func eagleRect(width: Int, height: Int){
    if width <= 0 || height <= 0 {
        print("Cannot print a rectangle with zero dimension")
    } else {
    let eagle = "🦅"
    var row = ""
    for _ in 0..<width{
        row = row + eagle
    }
    
    for _ in 0..<height{
        print(row)
    }
    }
}

eagleRect(width: 3, height: 4)

