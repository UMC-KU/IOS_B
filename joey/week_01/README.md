# iOS 1주차 워크북 (Swift 설명)

## 🎯핵심 키워드

- **절차 지향 언어 And 객체 지향 언어**
    
    절차 지향 언어
    
    순차적으로 실행되는 언어, 대표적으로 C
    
    - 장점
        
        빠르다
        
    - 단점
        
        유지 보수가 힘들다
        
    
    객체 지향 언어
    
    프로그램을 객체로 모델링해서  사용하는 언어
    
    특징으로는 캡슐화, 상속, 다형성, 추상화 등이 있다.
    
    C++, C#, Java, Python, Swift 등 많은 언어들이 객체지향 언어이다.
    
    - 장점
        
        재활용성이 좋기 때문에 코드의 유지보수가 쉽다.
        
    - 단점
        
        절차 지향에 비해서는 수행 속도가 느리다
        
    
- **Optional**
    
    값이 있을 수도 있고 없을 수도 있는 변수를 나타내기 위한 타입
    
    Swift는 변수 선언시 반드시 초기값이 필요하다
    
    ```swift
    var a:Int //에러 발생
    var b:Int = 13
    ```
    
    값이 필요없는 변수가 필요할 때도 있다.
    
    이 때 Swift는 nil을 사용해 값이 없다는 것을 나타낸다.
    
    nil은 타입은 존재하지만 값은 없다는 것을 가르킨다.
    
    ```swift
    var a:Int = nil // 에러 발생
    ```
    
    그렇다고 그냥 nil을 사용하면 에러가 발생한다.
    
    nil은 옵셔널 타입만 사용할 수 있다.
    
    옵셔널 타입을 사용하기 위해서는 ?를 사용한다.
    
    ```swift
    var a:Int? = nil
    var b:Int?
    
    print(b) // nil
    ```
    
    옵셔널타입은 초기값이 없어도 된다. 이 때 초기값은 nil로 설정된다.
    
    옵셔널을 그냥 사용하면 주의 문구가 뜬다.
    
    ![Screen_Shot_2022-03-16_at_4 21 57_PM](https://user-images.githubusercontent.com/71776532/158740771-9ce570ee-da63-4280-84f4-7d97373f87a1.png)
    
    옵셔널 언래핑
    
    옵셔널 타입은 그냥 사용할 수 없고 언래핑해서 Optional() 을 벗겨 사용해줘야한다.
    
    크게 3가지 방법을 사용한다.
    
    강제 언래핑 & 옵셔널 바인딩 & 옵셔널 언래핑
    
    - 강제 언래핑
        
        변수 뒤에 ! 를 사용해서 강제로 언래핑을 해준다.
        
        ![Screen_Shot_2022-03-16_at_4 23 35_PM](https://user-images.githubusercontent.com/71776532/158740776-e414c33f-3c5f-465d-be3d-d8db5c21de4a.png)
        
        이 때 변수의 값이 nil이면 런타임 에러가 발생하다.
        
        ```swift
        print(a!) // 런타임 에러 발생
        ```
        
        그렇기 때문에 완전 확실한 경우가 아니고서는 잘 사용하지 않는다.
        
    - 옵셔널 바인딩
        
        if 와 guard를 사용해 언래핑을 해주는 방법이다.
        
        - if
            
            ```swift
            if let c = b {
                    print(c) // b != nil 일 때 실행되는 블럭
            } else {
                print("nil") // b == nil 일 때 실행되는 블럭
            }
            print(c) // 에러 발생
            ```
            
            b가 nil 이 아닐 경우 c를 사용할 수 있다.
            
            b가 nil 일 경우 else {} 블럭이 실행된다. else 문은 생략 가능하다.
            
            if 를 사용해서 언래핑 해주면 코드 블럭 안에서만 사용이 가능하다.
            
        - guard
            
            swift에는 guard라는 키워드가 있다.
            
            ```swift
            func printD() {
                guard let d = b else {
                    return
                }
                print(d)
            }
            
            printD()
            ```
            
            guard문은 if와는 다르게 반드시 else 문을 적어줘야 한다.
            
            guard의 else 문에는 return 과 throw 만 올 수 있다. 그렇기 때문에 함수 안에서 사용한다.
            
            guard로 선언한 변수는 guard 블럭 밖에서 사용이 가능하다.
            
        
    - 옵셔널 체이닝
        
        옵셔널 체이닝은 . 을 사용해 구조체/클래스의 옵셔널 프로퍼티에 접근하기 위해 사용한다.
        
        ```swift
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
        
        ```
        
        구조체를 2개 선언했다.
        
        구조체의 인스턴스를 옵셔널 타입으로 선언했다.
        
        ```swift
        var konDuck:Student? = Student(age: 5, address: "seoul")
        ```
        
        이 때 그냥 접근하려고 하면 에러가 발생한다.
        
        ```swift
        print(konDuck.address.city) // 에러 발생
        ```
        
        옵셔널 체이닝을 사용해 값에 접근할 수 있다.
        
        ```swift
        print(konDuck?.address.city) //Optional("seoul) 출력
        ```
        
        옵셔널 체이닝을 사용하고 언래핑을 해줘야 값을 사용할 수 있다.
        
- **UIKit**
    
    iOS 앱을 만들기 위해 사용하는 프레임워크
    
    앱 인터페이스 구성을 위한 클래스를 지원한다.
    
    ```swift
    import UIKit
    ```
    
    iOS 13 부터 새로운 프레임워크 SwiftUI가 출시되었지만 현업에서는 아직 UIKit를 사용하는 추세이다. 
    
- **변수 선언**
    
    var를 사용해 변수를 선언한다.
    
    var로 선언한 값은 변경이 가능하다
    
    ```swift
    var num = 12
    num = 31
    
    print(num) //31
    ```
    
    let을 사용해 상수를 선언한다.
    
    let으로 선언한 값은 변경 불가능하다.
    
    ```swift
    let num = 13
    num = 32 //에러 발생
    ```
    
- **Func**
    
    함수를 선언하기 위해 사용하는 키워드
    
    ```swift
    func sum(a: Int, b: Int) -> Int {
        return a + b
    }
    ```
    
    파라미터(Parameter = 매개변수= 인자)는 0 ~ 여러 개가 가능하다
    
    ```swift
    // Parameter가 없어도 됨
    func helloWorld() -> String {
        return "Hello World"
    } 
    ```
    
    → 를 사용해 리턴 타입을 가르킨다.
    
    리턴 값이 없이도 함수를 정의할 수 있다. 
    
    ```swift
    func printHello() {
        print("Hello")
    }
    ```
    
    리턴 값이 없지만 정확히 따지면 Void 값을 리턴한다.
    
    일반적으로 함수를 선언하면 함수 호출시 파라미터 이름이 보인다.
    
    ```swift
    func introduceMyself(name: String, address: Int) -> String {
            return "My name is \(name)! I live in \(address)"
    }
    ```
    
    ![Screen_Shot_2022-03-15_at_10 41 36_PM](https://user-images.githubusercontent.com/71776532/158740755-f2eb8958-a461-490b-9b3e-831ccecfd5b3.png)
    
    매개변수 앞에 Argument Label를 정의해 함수를 호출할 때 가독성을 높일 수 있다.
    
    ```swift
    // 이 코드에서는 from이 Argument Label
    func introduceMyself(name: String, from address: Int) -> String {
            return "My name is \(name)! I live in \(address)"
    }
    ```
    
    ![Screen_Shot_2022-03-15_at_10 42 12_PM](https://user-images.githubusercontent.com/71776532/158740765-3c85b0b8-92cc-4d8a-b642-c305393d8549.png)
    
- **Class**
    
    객체의 한 종류
    
    클래스는 파스칼 표기법(첫 문자도 대문자로 시작하는 카멜표기법)로 선언한다.
    
    클래스 안에 프로퍼티(Property)를 선언한다.
    
    ```swift
    class Car {
        var wheels = 4 // 프로퍼티
    }
    ```
    
    프로퍼티에는 반드시 기본 값이 있어야 한다.
    
    인스턴스를 생성해서 사용한다.
    
    ```swift
    let sonata = Car()
    print(sonata.wheels) // 4를 출력한다.
    ```
    
    다른 프로그래밍 언어와 마찬가지로 상속이 가능하다.
    
    ```swift
    class SuperCar: Car{
        var limitSpeed = 300
    }
    ```
    
    다중 상속은 불가능하다.
    
- **Struct**
    
    객체의 한 종류
    
    클래스와 마찬가지로 파스칼 표기법으로 선언하며 프로퍼티를 가진다. 
    
    ```swift
    struct Person {
        let name:String
        var age:Int
    }
    ```
    
    위에 보이는 코드처럼 구조체는 초기값이 없어도 된다.
    
    다만 인스턴스 생성시 초기값을 넣어주어야 한다.
    
    ```swift
    let spiderMan = Person() // 에러 발생함 
    let santa = Person(name: "santa", age: 150)
    print(santa.age) // 150 출력
    ```
    
    - Why Pascal Case?
        
        클래스와 구조체를 선언할 때 파스칼 케이스를 사용한다.
        
        클래스와 구조체를 생성하는 것은 새로운 타입을 생성하는 것이기 때문이다.
        
        Int, String 처럼 타입은 항상 대문자로 작성하기에 파스칼 케이스를 사용한다.
        
    - Class vs Structure
        
        클래스와 구조체의 차이는 뭘까
        
    
    공통점
    
    - 프로퍼티를 사용해 값을 저장
    - 메소드를 선언하고 사용
    - 초기값 설정을 위한 이니셜라이져(init)을 정의
    - extension을 사용해 확장 가능
    - 프로토콜을 따른다
    
    차이점
    
    - 클래스는 상속이 가능하다
    - 클래스는 디이니셜라이져를 사용해 인스턴스가 할당된 메모리를 비울 수 있다.
    - 클래스는 참조 타입, 구조체는 값 타입이다.
    
    클래스는 참조타입이다.
    
    ```swift
    class LunchMenu {
        var main = "chicken"
        var drink = "zero-coke"
    }
    
    //나와 팀쿡은 동일한 세트를 시켰다.
    var myLunch = LunchMenu()
    var timCookLunch = myLunch
    // 팀쿡은 탄산을 마시지 않는다며 물로 바꿨다.
    timCookLunch.drink = "water"
    
    print(timCookLunch.drink)
    print(myLunch.drink)
    ```
    
    ![Screen_Shot_2022-03-16_at_4 12 58_PM](https://user-images.githubusercontent.com/71776532/158740767-9f12cd65-26ce-4690-831b-237ea882fb9c.png)
    
    둘 다 water로 바뀌었다.
    
    클래스가 참조 타입이기 때문이다.
    
    구조체는 참조타입이다.
    
    ```swift
    struct DinnerMenu {
        var main = "Hamburger"
        var drink = "coke"
    }
    
    var myDinner = DinnerMenu()
    var timCookDinner = myDinner
    timCookDinner.drink = "water"
    
    print(myDinner.drink)
    print(timCookDinner.drink)
    ```
    
    ![Screen_Shot_2022-03-16_at_4 16 03_PM](https://user-images.githubusercontent.com/71776532/158740769-81b95d2d-f606-4d92-a600-7bf4ac4cce5c.png)
    
- **What is “init()”**
    
    init() 은 이니셜라이져의 약자로 클래스와 구조체의 인스턴스가 생성될 때, 초기값을 생성하기 위해 호출된다.
    
    ```swift
    struct Phone {
        let model:String
        init() {
        model = "iphone-12"
        }
    }
    let myPhone = Phone()
    print(myPhone.model)
    ```
    
    초기값을 주면 init()을 생략해도 된다.
    
    ```swift
    struct Computer{
        let model = "MacBook-Pro-13"
    }
    ```
    
    그렇다면 만약에 초기값도 주고 init()도 설정하면 어떻게 될까??
    
    ```swift
    struct Computer {
        var model = "Macbook-Pro-13"
        init(){
            model = "Macbook-Air"
        }
    }
    
    let myComputer = Computer()
    print(myComputer.model)// Macbook-Air 출력
    ```
    
    init()으로 설정한 값이 저장된다.
    
    기본적으로 init()의 파라미터는 프로퍼티의 이름과 통일시켜준다.
    
    이때 프로퍼티 앞에 self를 붙여 구별한다.
    
    ```swift
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
    
    // "My Monitor's size is 24inch, company is LG" 출력
    ```
    
- **Break Point**
    
    xCode에서는 디버깅을 위한 중단점(BreakPoint)를 설정할 수 있다.
    
    Playground에서는 실행을 원하는 라인에서 run을 함으로써 BreakPoint 처럼 사용할 수 있다.
    
    ![Screen_Shot_2022-03-16_at_5 18 47_PM](https://user-images.githubusercontent.com/71776532/158740778-865677f1-6f40-421c-bc09-d3c6717aba86.png)
    
    ![Screen_Shot_2022-03-16_at_5 19 02_PM](https://user-images.githubusercontent.com/71776532/158740781-b5b64ad9-f07b-4e35-bbfa-de669d6fd55f.png)
    
    project에서는 라인 숫자를 클릭해 BreakPoint를 설정할 수 있다.
    
    ![Screen_Shot_2022-03-16_at_5 21 07_PM](https://user-images.githubusercontent.com/71776532/158740782-e3ac8f1d-840b-43e9-b1b1-dabdf7f4610a.png)
    
    위 코드는 15번 line까지만 실행된다.
    

# 1주차 수업 후기 📢

1주차라 프로그램 세팅이랑 아주 기본적인 내용만 해서 큰 어려움은 없었다.

# !주의사항

1. **과제 피드백 기반 진행입니다** - 한명씩 본인의 **과제를 발표**하는 시간 그리고 해온 **과제에 대한 피드백**을 하는 시간 (ex:전 이렇게 생각해서 이런 부분 다르게 해왔는데 저것도 괜찮은 것 같아요!)이 **무조건 기반**이 되어야 합니다!
2. 부가적으로 **워크북에서 제공되는 키워드 혹은 강의에서 들은 디테일 적인 부분**에서 더 토의해봐도 좋을 것 같습니다

## 🤔이것도 한 번 생각해봐요!

- **Optional을 공부하셨나요? 그럼 Optional을 어떻게 벗길까요?**
    
    옵셔널 언래핑
    

- **UIKit에는 엄청 많은 컴포넌트들이 존재해요! 여러분들이 자주 사용하게 될 컴포넌트 다섯개를 정해보고 왜인지 생각해봅시다! Ex. UILabel: 모든 앱에는 고정된 텍스트들이 들어가니깐 제일 많이 사용할 것 같다.**
    
    UILabel - 텍스트
    
    UITextField - 텍스트필드
    
    UIImageView - 이미지
    
    UIButton - 버튼
    
    UITableView - 리스트
    
    앱에서 어떤 것을 하는지 생각해보았다.
    
    우선 출력을 생각해보면 텍스트와 이미지를 출력한다.
    
    보통 텍스트와 이미지를 결합해 컴포넌트를 하나 만들고, 리스트로 출력을 한다.
    
    입력을 생각해보면 손가락으로 누르고 텍스트를 입력한다.
    

- **변수 선언에는 let 과 var이 있죠? 무슨 차이일까요?**
    
    변수 - 변경 가능
    
    상수 - 변경 불가능
    
    ```swift
    struct Circle {
        let radius = 5
    }
    
    var circle1 = Circle()
    circle1.radius = 4 // 가능??
    ```
    

    ```swift
    struct Cricle {
        var radius = 5
    }

    let circle2 = Circle()
    circle2.radius = 6 // 가능??
    ```
