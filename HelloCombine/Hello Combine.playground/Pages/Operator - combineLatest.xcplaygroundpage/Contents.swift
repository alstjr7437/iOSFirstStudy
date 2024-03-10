//: [Previous](@previous)

import Foundation
import Combine


// Basic CombineLatest
let strPublisher = PassthroughSubject<String, Never>()
let numPubsliher = PassthroughSubject<Int, Never>()

Publishers.CombineLatest(strPublisher, numPubsliher).sink{ (str, num) in
    print("Received: \(str), \(num)")
}
//strPublisher.combineLatest(numPubsliher).sink{ (str, num) in
//        print("Received: \(str), \(num)")
//}

// 아래와 같이 문자만 보내면 출력되는게 없음
"""
strPublisher.send("a")
strPublisher.send("b")
strPublisher.send("c")

numPubsliher.send(1)
numPubsliher.send(2)
numPubsliher.send(3)
"""


"""
데이터를 아래와 같이 보낼때
"a",            "b",        "c"
    1        2   3                   5

    "a", 1  "a",2 "b", 3    "c", 3  "c", 5
위와 같이 데이터를 보내줌
"""
strPublisher.send("a")
numPubsliher.send(1)
numPubsliher.send(2)
strPublisher.send("b")
numPubsliher.send(3)
strPublisher.send("c")
numPubsliher.send(5)

numPubsliher.send(3)

// Advanced CombineLatest

let usernamePublisher = PassthroughSubject<String, Never>()
let passwordPublisher = PassthroughSubject<String, Never>()

let validatedCrendentialsSubscription = usernamePublisher.combineLatest(passwordPublisher)
    .print("[Debug]")
    .map{ (username, password) -> Bool in
        return !username.isEmpty && !password.isEmpty && password.count > 12
    }
    .sink{ valid in
        print("Credential valid? : \(valid)")
    }

usernamePublisher.send("minseok")
passwordPublisher.send("hello")
passwordPublisher.send("verystrongpassword")

// Merge
// 타입이 같아야 머지가 됨 아니면 위에 처럼 튜플형식으로
let publisher1 = [1,2,3,4,5].publisher
let publisher2 = [300,400,500].publisher

let mergePublisherSubscrition = Publishers.Merge(publisher1, publisher2)
//    .print("[Debug]")
    .sink { value in
        print("Merge: subscrition recevied value: \(value)")
    }

//let mergePublisherSubscrition = publisher1.merge(with: publisher2)
////    .print("[Debug]")
//    .sink { value in
//        print("Merge: subscrition recevied value: \(value)")
//    }


//: [Next](@next)
