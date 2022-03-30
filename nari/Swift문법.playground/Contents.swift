import UIKit

/*1. 변수와 상수 선언*/
// 1.1 상수
let name: String = "Uno"
let swift = "Swift"

//1.2 변수
var year: Int = 2022
var y = 2022

year = 2023

print(year)

/*2. 함수 만들기*/
func sum(a: Int, b: Int) -> Int {
    return a+b
}

print(sum(a:1,b:2))

func multiply(a: Int, b:Int) -> Int{
    a*b  //함수 선언 시 이처럼 식이 한 줄로 끝날 때 return을 생략 가능
}

print(multiply(a: 10, b:10))

/* 3. 이름 짓기*/
//3.1. Lower Camel Case - 인스턴스 / 메소드 / 함수
// - 시작은 소문자 나머지 단어의 시작은 대문자

let viewController = UIViewController()

//3.2. Upper Camel Case - 구조체 / 클래스/ 프로토콜
//-시작과 나머지 단어도 모두 대문자

struct Person{ // 구조체는 자동으로 초기화 함수를 생성해주지만
    let a: Int
    let b: Int
}

class Operator{  //클래스는 자동으로 초기화 함수를 생성해주지 않는다.
    let a: Int
    let b: Int
    
    init(a: Int, b:Int){
        self.a=a
        self.b=b
    } //초기화함수: 클래스 인스턴스가 생성될 때 최초에 생성되는 함수
}

protocol Flyable{
    func fly()
} // 어떤 메세징을 보낼지만 선언. 구체적인 선언은 클래스, 구조체 내부에서 해당 프로토콜을 채택한 객체가 직접 구현
