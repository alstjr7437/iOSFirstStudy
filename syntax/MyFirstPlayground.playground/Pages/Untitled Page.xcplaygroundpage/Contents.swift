"""
// 2024.12.27
//var greeting = "Hello, playground"

// 변수 및 상수
var str = "Hello, swift"
str = "Hello, world"
print(str)

var age = 20

var money = 2_000_000
print(money)

var days: Int = 5
print(days)

// 배열
let age2 = [10,20,30]
let colors = ["red", "green", "blue"]

print(age2[0])

// 딕셔너리
let language = ["한국":"KR", "미국":"EN", "일본":"JA"]

print(language["미국"])

// enum
enum WeekDay: Int {
    case MON
    case TUE
    case WED
    case THU
    case FRI
    case SAT
    case SUN
}

var today: WeekDay = .MON
print(today)

today = WeekDay.FRI
print(today)

today = WeekDay(rawValue: 2)!
print(today)

enum MediaType {
    case audio(String)
    case video(String)
}

var mp3 = MediaType.audio("mp3")
print(mp3)
var h264 = MediaType.video("h264")
print(h264)

enum Direction: String {
    case up
    case down = "hello"
}
var dir = Direction.up
dir.rawValue

var dir2 = Direction.down
dir2.rawValue

// if
let age3 = 10
if age3 >= 10 && age3 < 20{
    print("10대")
} else if age3 >= 20 && age3 < 30{
    print("20대")
}

// switch
enum Weather {
    case sun
    case cloud
    case rain
}
var weather = Weather.sun
switch weather{
case .sun:
    print("맑음")
case .cloud:
    print("흐림")
case .rain:
    print("비옴")
}

let name = "김민"
switch name{
case "김민석":
    print("김민석입니다.")
default:
    print("김민석이 아닙니다.")
}

"""
let age4 = 10
let age5 = 20
let ageSame = age4 == age5 ? "same" : "not same"

//2024.12.28
//for
let numRange = 1...10
// 1부터 10까지
let a = 10
for i in 0...a{
    print("num is \(i)")
}
//0 부터 10까지 출력

let ages = [3,20,60]
let language = ["한국":"KR", "미국":"EN", "일본":"JA"]

for age in ages {
    print("ages \(age)")
}

for (key,value) in language{
    print("\(key)의 언어 코드는 \(value)")
}

//while
var num1 = 1
while num1 <= 20{
    print(num1)
    num1 += 1
}
print("hello")

//break
var count = 10
while count > 0{
    if count == 3 {
        break
    }
    print(count)
    count -= 1
}

// Optional
// 값이 있을 수도 없을 수도 있는 경우
var name: String?
let num5: Int? = nil
print(name)
// Expression implicitly coerced from 'String?' to 'Any' Warning
name = "minseok"
print(name)
name = nil
// Warning 없애기
print(name ?? "없음")

//타입 변환하기
let number = "10"
print(Int(number))
print(type(of: number))
print(type(of: Int(number)))

//아래와 같은 문자열에서 숫자로 변경은 안됨
var hello1 = "10"
// hello1 = Int(10) // 에러 발생

// 처음 선언시 타입 변경해주기
let hello2 = Int("10")
print(type(of: hello2))

// 내림으로 계산
let hello = 10.99
print(Int(hello))

print("-------------------")

// magnitude, abs : 절대값 구하기
// 둘 다 절대값을 구하는 것이지만, 전자는 타입이 변할 수 있으며, 후자는 불가능
let integer2 = Int(-15)
print(type(of: integer2))
let magnitude = integer2.magnitude
let absNum = abs(integer2)

print(type(of: magnitude))
print(type(of: absNum))

print(magnitude is Int)
print(absNum is Int)
// 가능하면은 abs를 사용하면 좋다. 헤더를 보면서 이해해보도록(Command + Control + Shift + 클릭) 하자.
