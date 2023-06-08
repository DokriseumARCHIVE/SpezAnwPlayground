//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//////////////////////////////////////////////////////////
///
///      ENUMERATION
///
//////////////////////////////////////////////////////////

/**
enum {
    case north
    case east
    case south
    case west
}
var dirToHead = ".south" //.south wenn datentyp behandelt?
// alle Fälle müssen behandelt werden
switch dirToHead {
case .north:
    print("Norden")
case .east:
    print("Osten")
case .south:
    print("Sueden")
case .west:
    print("Westen")
default:
    print("nicht behandelt")
}
 **/

enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

var productBarcode = Barcode.upc(8, 85909, 51226, 3)
productBarcode = .qrCode("htw-berlin.de")

switch productBarcode {
case .upc(let numberSystem, let manufacturer, let product, let check):
    print ("UPC: \(numberSystem) - Hersteller \(manufacturer) - Produkt \(product) - Checksumme \(check)")
case .qrCode(let productCode):
    print("Produktcode \(productCode)")
default:
    print("nicht gueltiger Barcode")
}


///##########
// Raw Value
///##########

enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}

let stringstring = "abc \(ASCIIControlCharacter.lineFeed.rawValue) def"
//---------------------------------------
enum Compass: Double {
case north = 0.0
case east = 90.0
case south = 180.0
case west = 270.0
}

let flightDirection = Compass.east

flightDirection.rawValue

enum Engine: CaseIterable {
    case otto
    case diesel
    case electro
}

let engines = Engine.allCases//.count
let engines_count = Engine.allCases.count

for engine in engines {
    print(engine)
}

///#################
// Associated Value
///#################

enum ForeignCurrency {
    case dollar(Double)
    case pound(Double)
    case yen(Double)
    
    func getEuro(amount: Double) -> Double {
        var value = 0.0
        func calculate(_ factor: Double) -> Double {
            return amount * factor
        }
        
        switch self {
        case .dollar(let factor):
            value = calculate(factor)
        case .pound(let factor):
            value = calculate(factor)
        case .yen(let factor):
            value = calculate(factor)
        default:
            value = calculate(0.0)
        }
        
        return value
    }
}

//let dollar = ForeignCurrency.dollar(45.2)

let dollar = ForeignCurrency.dollar(1.07)
let euroFromDollar = dollar.getEuro(amount: 1290)



////////////////////////////////////////////////////////////////////////
///
///      STRUKTUR & KLASSE
///
////////////////////////////////////////////////////////////////////////

enum Thrust { //Trust = Vortrieb
    case propeller
    case jet
    case none
}

enum Lift {
    case fixedWing
    case roter
}

struct Airplane {
    let thrust : Thrust
    let power: Double
    var speed: Double
}

var airbus = Airplane(thrust: .jet, power: 3000, speed: 970)

airbus.speed = 1200
print("Airbus Struct Speed: \(airbus.speed)")

var piper = Airplane(thrust: .propeller, power: 345, speed: 270)
airbus = piper

print("Airbus Struct Speed: \(airbus.speed)")
airbus.speed = 890
print("Airbus Struct Speed: \(airbus.speed)")

print("Piper Speed: \(piper.speed)")

struct AircraftEngine {
    typealias Hours = Double
    var power: Double
    var isOn = false
    var operatingTime: Hours
    
    mutating func startEngine() {
        isOn = true //in struct nicht veränderbar, da immutable -> daher "mutating func ..."
        print("Maschine laeuft")
    }
}

class AirplaneClass {
    let thrust: Thrust
    let power: Double
    var speed: Double
    
    init(thrust: Thrust, power: Double, speed: Double) {
        self.thrust = thrust
        self.power = power
        self.speed = speed
    }
}

let airbusClass = AirplaneClass(thrust: .jet, power: 3900, speed: 870)
//let airbusClass2 = AirplaneClass(Thrust.jet, 3900, 370)

print("Airbus Class Speed: \(airbusClass.speed)")
//print(airbusClass2.speed)

let cessna = airbusClass
print("Cessna Speed: \(cessna.speed)")
cessna.speed = 340
print("Cessna Speed: \(cessna.speed)")
print("Airbus Class Speed: \(airbusClass.speed)")
//: [Next](@next)
