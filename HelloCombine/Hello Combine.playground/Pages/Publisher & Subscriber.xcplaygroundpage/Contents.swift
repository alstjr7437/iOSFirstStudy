//: [Previous](@previous)

import Foundation
import Combine

// Publisher & Subscriber

let just = Just(1000)
let subscription = just.sink { value in
        print("Recevied Value: \(value)")
}

// publisher가 만들어서 보내고
// sink가 subscriber라서 받아서 출력
let arrayPublisher = [1,3,5,7,9].publisher
let subscription2 = arrayPublisher.sink {value in
    print("Recevied Value: \(value)")
}

class MyClass {
    var property: Int = 0{
        didSet{
            print("Did set property to \(property)")
        }
    }
}

// arrayPublisher가 배출 될때 마다 property에 값을 셋팅
let object = MyClass()
let subscription3 = arrayPublisher.assign(to: \.property, on: object)
print("Final Value: \(object.property)")

//object.property = 3






//: [Next](@next)

