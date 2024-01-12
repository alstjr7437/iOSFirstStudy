protocol Coach {
    var name: String { get set }
    var currentTeam: String { get }
    func training()
    func direct()
}

struct Mourinho: Coach {
    var name: String = "Jose Mourinho"
    var currentTeam: String = "AS Roma"
    
    func training() {
        print("Traing Player")
    }
    
    func direct() {
        print("Direct Game")
    }
}

let mourinho = Mourinho()
print("\(mourinho.name), \( mourinho.currentTeam)")
mourinho.training()
mourinho.direct()

//    Jose Mourinho, AS Roma
//    Traing Player
//    Direct Game


func makeTriple(num: inout Int){
    num *= 3
}
var num = 8
makeTriple(num: &num)
print(num)
