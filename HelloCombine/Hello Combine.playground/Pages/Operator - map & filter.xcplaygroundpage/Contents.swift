//: [Previous](@previous)

import Foundation
import Combine

// Transform - Map
// Map은 데이터를 가공해주는 역할 - 숫자 2배로 곱해서 출력
let numPublisher = PassthroughSubject<Int, Never>()
let subscription1 = numPublisher
//    .print("[Debug]")
    .map { $0 * 2 }
    .sink{value in
        print("Transformed Value: \(value)")
    }

numPublisher.send(10)
numPublisher.send(20)
numPublisher.send(30)
subscription1.cancel()

// Filter
// 필터 이용해서 a를 포함한거만 value 출력
let stringPublisher = PassthroughSubject<String, Never>()
let subscription2 = stringPublisher
//    .print("[Debug]")
    .filter{ $0.contains("a")}
    .sink{value in
        print("Filterd Value: \(value)")
    }

stringPublisher.send("abc")
stringPublisher.send("Kim")
stringPublisher.send("Min")
stringPublisher.send("Seok")
stringPublisher.send("age")
subscription2.cancel()

//: [Next](@next)
