import UIKit

func canRunForCongress(age: Int, yearsOfCitizenShip: Int, residentInState: Bool) -> Bool {
    var canRun = false
    if age < 25{
        print("You're too young. You need to be at least 25, but you're only \(age) years old")
    }
    if !residentInState {
        print("You need to live in the state that you are running to represent")
    }
    if yearsOfCitizenShip < 7 {
        print("You need to be a citizen for at least 7 years, but you've only been a citizen for \(yearsOfCitizenShip)")
    }
    if (age >= 25 && residentInState && yearsOfCitizenShip >= 7){
        canRun = true
    }
    return canRun
}

var name = ["Eric Nam", "Adele", "Rachel McAdams", "Justin Bieber"]
var age = [25, 30, 40, 24]
var residentInState = [true, true, true, false]
var yearsOfCitizenship = [25, 2, 5, 0]

for x in 0..<name.count{
    let run = canRunForCongress(age: age[x], yearsOfCitizenShip: yearsOfCitizenship[x], residentInState: residentInState[x])
    if run {
        print("\(name[x]), you can run for congress")
    } else {
        print("\(name[x]), you can't run for congress")
    }
    print()
}
