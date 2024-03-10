//: [Previous](@previous)

import Foundation
import Combine

let arrPubsliher = [1,2,3].publisher

let queue = DispatchQueue(label: "custom")


// custom number가 1은 메인 스레드 다른건 메인이 아닌 스레드(queue)
// 서버나 데이터 처리 같은 작업 헤비한건 백그라운드에서 돌리고
// 다 작업하고 UI 업데이트시 메인 스레드에서 받는다
let subscrition = arrPubsliher
    .subscribe(on: queue)
    .map{ value in
        print("transform: \(value), thread: \(Thread.current)")
        return value
    }
    .receive(on: DispatchQueue.main)
    .sink { value in
    print("Receive Value: \(value), thread: \(Thread.current)")
}


//: [Next](@next)
