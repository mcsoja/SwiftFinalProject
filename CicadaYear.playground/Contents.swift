import UIKit

func cicadaYear(year: Int){
    if (year  % 17 == 10){
        print("\(year) is a cicada year")
    } else {
        var yearsLeft = 17 - (year % 17 - 10)
        if yearsLeft > 17{
            yearsLeft = yearsLeft - 17
        }
        if yearsLeft == 1 {
            print("There will be 1 more year until the next cicada year")
        } else {
            print("There will be \(yearsLeft) more years until the next cicada year")
        }
    }
}

cicadaYear(year: 2049)

