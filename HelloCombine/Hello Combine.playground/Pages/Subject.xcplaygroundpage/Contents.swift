import Foundation
import Combine

// PassthroughSubject
// output type String, 실패시 어떤 형태 는 Never(실패 X)
let relay = PassthroughSubject<String, Never>()

relay.send("Initial text")

let subscription1 = relay.sink{ value in
    print("subscription1 received value:\(value)")
}

relay.send("Hello!")
relay.send("World!")



// CurrentValueSubject
// 초기값이 필요함
// .value로 마지막 값을 확인 가능
let variable = CurrentValueSubject<String, Never>("")

variable.send("Initial text")

let subscription2 = variable.sink {value in
    print("subscription2 received value: \(value)")
}

variable.send("More text")
print(variable.value)




let publisher = ["Here", "we", "go"].publisher

publisher.subscribe(relay)
"""
아래와 같은 효과
relay.send("Here")
relay.send("we")
relay.send("go")
"""
publisher.subscribe(variable)



