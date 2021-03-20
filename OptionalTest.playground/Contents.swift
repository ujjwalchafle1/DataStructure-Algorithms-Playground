import UIKit

var str = "Hello, playground"
//func highestScore(scores: [String: Int]) {
//  var currentHighScore = 0
//  //Write your code here.
//  for student in scores
//  {
//    if currentHighScore < student.value {
//        currentHighScore = student.value
//    }
//  }
//    print(currentHighScore)
//}
//
//
////Try some different scores.
////Dont add the lines below to udemy!
//highestScore(
//    scores: [
//    "Amy": 100,
//    "James": 65,
//    "Helen": 92
//    ]
//)
func isOdd(n:Int) -> Bool{
    return n % 2 == 0 ? false : true
}



//Try some different numbers below:
//Dont take this code to Udemy.
let numberIsOdd = isOdd(n: 57)
print(numberIsOdd)

struct User {
    var name:String
    var email:String?
    var followers:Int
    var isActive:Bool
    
    func logStatus()
    {
        if self.isActive {
            print("\(self.name) is working hard")
        } else {
            print("\(self.name) has left earth")
        }
    }
}

let user = User(name: "Richard", email: nil, followers: 0, isActive: false)
user.logStatus()



func isLeap(year: Int) {
  
  //Write your code inside this function.
  if (year % 4 == 0)
  {
      //leap year
    if (year % 100 == 0) {
        if (year % 400 == 0){
            print("YES")
        } else {
            print("NO")
        }
    } else {
        print("YES")
    }
  } else {
        print("NO")
  }
}

//Try out your function with some different years. Don't copy the line below to Udemy.
isLeap(year: 1900)

print(2000 % 4)
print(2000 % 100)
print(2000 % 400)


func exercise() {

    //Don't change this
    var stockTickers: [String: String] = [
        "APPL" : "Apple Inc",
        "HOG": "Harley-Davidson Inc",
        "BOOM": "Dynamic Materials",
        "HEINY": "Heineken",
        "BEN": "Franklin Resources Inc"
    ]
    
    //Write your code here.
    stockTickers["WORK"] = "Slack Technologies Inc"
    stockTickers["BOOM"] = "DMC Global Inc"

  
     //Don't modify this
    print(stockTickers["WORK"]!)
    print(stockTickers["BOOM"]!)
}
 
exercise()

struct MyStruct {
    var property1 : String
    var property2 = 2
}
class MyClass {
    var property1 : String?
    var property2 = 22
    let new1234 : Int?
    
    init() {
        new1234 = 9879
    }
}

var myStruct = MyStruct(property1: "abc", property2: 3)
print(myStruct.property1)

var myClass = MyClass()
print(myClass.new1234)

var new123 = 123
let new1234 : Int

new1234 = 567

protocol FullyNamed {
    var fullName: String { get }
}

struct Person: FullyNamed {
    var fullName: String
}
var john = Person(fullName: "John Appleseed")
john.fullName = "fyfy"

struct Item {
    
}

class ItemsViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!

    var items: [Item]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        items = [item1, item2]
    }
    }
}
 
