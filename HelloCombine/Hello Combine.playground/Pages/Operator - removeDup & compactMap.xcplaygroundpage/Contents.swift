//: [Previous](@previous)

import Foundation
import Combine

var subscriptions = Set<AnyCancellable>()

// removeDuplicates
// 중복 제거 하기
let words = "hey hey there! Mr Mr ?"
    .components(separatedBy: " ")
    .publisher
words
    .removeDuplicates()
    .sink{ value in
        print(value)
    }.store(in: &subscriptions)

// compactMap
// 해당으로 캐스팅이 가능한 녀석들만 출력하도록 Float("a")는 안되니까
let strings = ["a", "1.24", "3", "def", "45", "0.23"].publisher
strings
    .compactMap{ Float($0) }
    .sink{ value in
        print(value)
    }.store(in: &subscriptions)


// ignoreOutput
// 다 ignore해서 그냥 끝남
let number = (1...10_000).publisher
number
    .ignoreOutput()
    .sink(receiveCompletion: { print("Completed with: \($0)") },
          receiveValue: { print($0) })
    .store(in: &subscriptions)


// prefix
// prefix로 데이터 2개 받고 끝남
let tens = (1...10).publisher

tens
    .prefix(2)
    .sink(receiveCompletion: { print("Completed with: \($0)") },
          receiveValue: { print($0) })
    .store(in: &subscriptions)

