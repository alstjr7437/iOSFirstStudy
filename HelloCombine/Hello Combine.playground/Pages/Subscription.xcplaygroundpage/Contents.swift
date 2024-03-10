//: [Previous](@previous)

import Foundation
import Combine

let subject = PassthroughSubject<String, Never>()


// The print() operator prints you all lifecycle events
let subscription = subject
    .print("[Debug]")
    .sink{ value in
        print("Subscriber received value \(value)")
}


// completion을 보내서 관계가 끝남
subject.send("Hello")
subject.send("Hello again")
subject.send("Hello for the last time!")
// finish를 해서 끝낼 수도 있고 Cancle을 해서 끊을 수도 있음
//subject.send(completion: .finished)
subscription.cancel()
subject.send("Hello ?? :(")

//: [Next](@next)
