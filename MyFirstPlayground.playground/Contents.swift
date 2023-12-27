
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

let age4 = 10
let age5 = 20
let ageSame = age4 == age5 ? "same" : "not same"
