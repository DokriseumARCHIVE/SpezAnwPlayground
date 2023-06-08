var greeting = "Hello, playground"
var number = 45
let animals = ["Bear", "Tiger", "Bird"]
var emptyArray = [String]()
emptyArray.append("Ford Prefect")
emptyArray
var httpCodes = [400: "Bad Request", 200: "OK", 500: "Internal Server Error", 418: "I am a teapot"]
httpCodes[418]
for animal in animals {
if animal.count > 4 {
print(animal)
}
}
var stringNumber = "190"
let intNumber = Int(stringNumber)
print(type(of: intNumber))
//number = intNumber!
var largeNumber = 900
if let convertedInt = Int(stringNumber) {
if convertedInt > 180 {
number = convertedInt
}
}
if let largeConvertedNumber = Int(stringNumber), largeConvertedNumber > 180
{
number = largeConvertedNumber
}
var implicitlyString = ""
implicitlyString = "was mit Ausrufezeichen"
greeting = implicitlyString
var optionalString: String?
optionalString = nil
optionalString = "mit was drin"
greeting = optionalString!
func doubleInput(input: Int) -> Int {
// var input = input
// input *= 2
return input * 2
}
