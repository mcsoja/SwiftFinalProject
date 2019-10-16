import UIKit

var xPt = 3
var yPt = 2
var lowX = 1
var lowY = 1
var highX = 3
var highY = 3

if (xPt <= highX) && (xPt >= lowX) && (yPt <= highY) && (yPt >= lowY){
    print("Score!")
} else {
    print("Missed!")
}
