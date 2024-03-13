//: [Previous](@previous)

import Foundation
import UIKit
import Combine

final class SomeViewModel{
    @Published var name: String = "Kim"
    var age: Int = 25
}

final class Label{
    var text: String = ""
}

let label = Label()
let vm = SomeViewModel()
print("text : \(label.text)")

vm.$name.assign(to: \.text, on: label)
print("text : \(label.text)")

vm.name = "Min"
print("text : \(label.text)")

vm.name = "Seok"
print("text : \(label.text)")

label.text = "\(vm.age)"
print("text: \(label.text)")

//: [Next](@next)
