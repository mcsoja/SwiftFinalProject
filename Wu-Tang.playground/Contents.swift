import UIKit

var str = "Hello, playground"

let members = ["RZA", "GZA", "Method Man", "Raekwon", "Ghostface", "Inspectah Deck", "U-God", "Masta Killa", "Cappadonna"]

//#1
for x in 0...members.count - 1{
    if members[x].contains("GZA") {
        let sir = "Sir " + members[x]
        print(sir)
    } else {
        print(members[x])
    }
}


//#2
for y in 0..<members.count{
    if members[y].contains("GZA") {
        let sir = "Sir " + members[y]
        print(sir)
    } else {
        print(members[y])
    }
}


//#3
for name in members{
    if name.contains("GZA") {
        let sir = "Sir " + name
        print(sir)
    } else {
        print(name)
    }
}

