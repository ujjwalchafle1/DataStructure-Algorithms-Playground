import UIKit

var str = "Hello, playground"

let sizeOfPizza = 10

//computed properties with setter and getter
var numberOfSlices : Int {
    get{
        return sizeOfPizza - 6
    }
    set {
        print("new value is \(newValue)")
    }
}


numberOfSlices = 100
print(numberOfSlices)



struct MyStruct {
    var property1 : String
    var property2 = 2
}

var myStruct = MyStruct(property1: "abc", property2: 3)
print(myStruct.property2)

//observed properties
var alarmTriggered: Int = 0{
    willSet{
        print(newValue)
        print(alarmTriggered)
    }
    didSet{
        print(oldValue)
        print(alarmTriggered)
        if alarmTriggered > 1 {
            print("Invalid state defaulting to 0")
            alarmTriggered = 0
        }

    }
}

    alarmTriggered = 1
    print(alarmTriggered)


struct Point {
    var x = 0.0, y = 0.0
}
struct Size {
    var width = 0.0, height = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set(updatedCenter) {
            origin.x = updatedCenter.x - (size.width / 2)
            origin.y = updatedCenter.y - (size.height / 2)
        }
    }
}
var square = Rect(origin: Point(x: 0.0, y: 0.0),
                  size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
square.center = Point(x: 15.0, y: 15.0)
print("square.origin is now at (\(square.origin.x), \(square.origin.y))")
// Prints "square.origin is now at (10.0, 10.0)"



///MARK:- Enumerations
enum CompassPoint: String {
    case north
    case south
    case east
    case west
}

enum Planet:Int {
    case mercury=1, venus, earth, mars, jupiter, saturn, uranus, neptune
}

var whatDirection = CompassPoint.west

switch whatDirection {
case .east:
    print("East")
case .west:
    print("west")
case .north:
    print("north")
default:
    print("Up/Down")

}

enum Beverage: CaseIterable {
    case coffee, tea, juice
}

let numberOfChoices = Beverage.allCases
print("\(numberOfChoices[0]) beverages available")
// Prints "3 beverages available"
for beverage in Beverage.allCases {
    print(beverage)
}


