///import UIKit

////////////////////////////////////////////////////////////////////////
///
///      VERERBUNG
///
////////////////////////////////////////////////////////////////////////

struct AircraftEngine {
    typealias Hours = Double
    var power: Double
    var isOn = false
    var operatingTime: Hours
    
    mutating func startEngine() {
        isOn = true //in struct nicht veränderbar, da immutable -> daher "mutating func ..."
        print("Maschinenmotor \(isOn)")
    }
    
    mutating func stopEngine() {
        isOn = false //in struct nicht veränderbar, da immutable -> daher "mutating func ..."
        print("Maschinemotor \(isOn)")
    }
}


enum Thrust { //Trust = Vortrieb
    case propeller
    case jet
    case none
}

enum Lift {
    case fixedWing
    case roter
}


class Aircraft {
    let thrust: Thrust
    var speed: Double
    var range: Double
    let lift: Lift
    
    init(thrust: Thrust, lift: Lift) {
        self.thrust = thrust
        self.lift = lift
        self.range = 0.0
        self.speed = 0.0
    }
    
    func takeoff() {
        print("TakeOff")
    }
    
    func landing() {
        print("Landing")
    }
}

class Aeroplane: Aircraft {
    enum WingPosition {
        case low
        case mid
        case high
    }
    
    let wingPosition: WingPosition
    var engine: AircraftEngine?
    
    override init(thrust: Thrust, lift: Lift) {
        wingPosition = .low
        super.init(thrust: thrust, lift: lift)
    }
    
    init(thrust: Thrust, wingPosition: WingPosition) {
        /**
         * Geht nicht, alles muss erst einen Wert haben
         * if self.thrust != .none {
         *     engine = AircraftEngine(power: 300.0, operatingTime: 210.0)
         * } else {
         *     engine = AircraftEngine(power: 0.0, operatingTime: 210.0)
         *     print("Segelflugzeug")
         * }
         * //engine?.power = 0.0
         **/
        self.wingPosition = wingPosition
        super.init(thrust: thrust, lift: .fixedWing)
        if self.thrust != .none {
            engine = AircraftEngine(power: 300.0, operatingTime: 210.0)
        }
        
    }
}

////////////////////////////////////////////////////////////////////////
///
///         PROTOCOL
///
////////////////////////////////////////////////////////////////////////

protocol Engine {
    var power: Double { get set }
    var isOn: Bool { get set }
    mutating func startEngine()
    mutating func stopEngine()
}

struct Diesel: Engine {
    /// stored property
    var power: Double
    /// stored property
    var isOn: Bool
    /// computed property
    var isPolluting: Bool {
        if power > 100 {
            return true
        } else {
            return false
        }
    }
    
    mutating func startEngine() {
        self.isOn = true
    }
    
    mutating func stopEngine() {
        self.isOn = false
    }
}

var bmwEngine = Diesel(power: 120, isOn: false)
bmwEngine.isPolluting // = true
bmwEngine.power = 90
bmwEngine.isPolluting // = false

////////////////////////////////////////////////////////////////////////
///
///         EXTENSIONS
///
////////////////////////////////////////////////////////////////////////

extension AircraftEngine {
    var fuelConsumption: Double {
        return operatingTime * 25.0
    }
}

var cessnaEngine = AircraftEngine(power: 230, operatingTime: 23)
cessnaEngine.fuelConsumption

/// EXTENSION mit Bedingung

extension Array where Element == Int {
    var avarage: Double {
        var sum = 0
        for element in self {
            sum += element
        }
        return Double(sum) / Double(self.count)
    }
    /**
    var median: Double {
        let sortedArray = self.sorted()
        if (sortedArray.count % 2) == 0 {
            return Double(
                (sortedArray[
                    (sortedArray.count / 2) - 1
                ] / 2)
                +
                (sortedArray[
                    sortedArray.count / 2
                ] / 2)
            )
        } else {
            return Double(
                sortedArray[sortedArray.count / 2]
            )
        }
    }
     **/
    var median: Double? {
            guard !isEmpty else {
                return nil
            }
            
            let sortedArray = sorted()
            let middleIndex = sortedArray.count / 2
            
            if sortedArray.count % 2 == 0 {
                // Array has an even number of elements, so we take the average of the middle two elements
                return Double(sortedArray[middleIndex - 1] + sortedArray[middleIndex]) / 2.0
            } else {
                // Array has an odd number of elements, so we simply return the middle element
                return Double(sortedArray[middleIndex])
            }
        }
    /**
     var average: Double
     var median: self.first.typeof
     **/
}

var incomeAtApple = [95_000, 50_000, 62_000, 75_000_000]

var avg = incomeAtApple.avarage
var median = incomeAtApple.median
