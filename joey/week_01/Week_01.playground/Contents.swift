import UIKit

// 옵셔널(Optionals)
var a:Int?
var b:Int? = 42


//강제 언래핑
print(b!)


//옵셔널 바인딩
if let c = b {
    print(c)
} else {
    print("nil")
}

func printD() {
    guard let d = b else {
        return
    }
    print(d)
}

printD()


// 옵셔널 체이닝
struct Address {
    var city:String
}

struct Student {
    var age:Int
    var address: Address

    init(age : Int, address: String){
        self.age = age
        self.address = Address(city: address)
    }
}

var konDuck:Student? = Student(age: 5, address: "seoul")
print(konDuck?.address.city)




// 함수
func introduceMyself(name: String, from address: Int) -> String {
        return "My name is \(name)! I live in \(address)"
}



// 클래스
class Car {
    var wheels = 4
}

let sonata = Car()
print(sonata.wheels)

class SuperCar: Car{
    var limitSpeed = 300
}

var ferrari = SuperCar()
print(ferrari.limitSpeed)



// 구조체
struct Person {
    let name:String
    var age:Int
}

let santa = Person(name: "santa", age: 150)
print(santa.name)


// 클래스 vs 구조체
// 클래스는 참조 타입
class LunchMenu {
    var main = "chicken"
    var drink = "zero-coke"
}

var myLunch = LunchMenu()
var timCookLunch = myLunch
timCookLunch.drink = "water"

print(timCookLunch.drink)
print(myLunch.drink)

// 구조체는 값 타입
struct DinnerMenu {
    var main = "Hamburger"
    var drink = "coke"
}

var myDinner = DinnerMenu()
var timCookDinner = myDinner
timCookDinner.drink = "water"

print(myDinner.drink)
print(timCookDinner.drink)



//init()
struct Phone {
    let model:String
    init(){
        model = "iphone-12"
    }
}

let myPhone = Phone()
print(myPhone.model)


struct Computer {
    var model = "Macbook-Pro-13"
    init(){
        model = "Macbook-Air"
    }
}

let myComputer = Computer()
print(myComputer.model)

struct Monitor {
    var size:Int
    var company: String

    init(size:Int, company:String){
        self.size = size
        self.company = company
    }
}

let myMonitor = Monitor(size: 24, company: "LG")
print("My Monitor's size is \(myMonitor.size)inch, company is \(myMonitor.company)")




