//: [Previous](@previous)

import Foundation;

var greeting = "Hello, playground";

//////////////////////////////////
///
/// ----------
/// Function Type
/// ----------
///
/// ////////////////////////////

/// /////////////
/// Teil 1
/// /////////////

func addTwoInts(first: Int, second: Int) -> Int {
    return first + second;
}

func multiplyTwoInts(first: Int, second: Int) -> Int {
    return first * second;
}

func substractTwoInts(first: Int, second: Int) -> Int {
    return first - second;
}

func multiplyTwoIntsAlternatice(first: Int, second: Int) -> Int {
    first * second; // bei Integer kann man auf return verzichten
}

var mathFunction: (Int, Int) -> Int = addTwoInts; // man weist hier die gesamte Funktion zu

mathFunction(2,5);

mathFunction = substractTwoInts; // man weist hier die gesamte Funktion zu

mathFunction(2,5);

/// /////////////
/// Teil 2
/// /////////////

let mathArray: [(Int, Int) -> Int] = [addTwoInts,substractTwoInts,multiplyTwoInts];
mathArray[2](2,5);


func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    let result = mathFunction(a,b);
    print(result);
}

printMathResult(mathArray[1],23,42);
printMathResult(mathArray[2],23,42);

/// /////////////
/// Teil 3
/// /////////////

func stepForward (_ input: Int) -> Int {
    return input + 1;
}

func stepBackward (_ input: Int) -> Int {
    return input - 1;
}

func chooseStepFunction(backward: Bool) -> ((Int) -> Int) { // (Int) -> Int => Funktionstyp
    return backward ? stepBackward : stepForward;
}

var currentValue = 42;
let moveToZero = chooseStepFunction(backward: currentValue > 0);

print("Count to Zero");

while currentValue != 0 {
    currentValue = moveToZero(currentValue);
}

currentValue = 242;


while currentValue != 0 {
    currentValue = moveToZero(currentValue);
}

//////////////////////////////////
///
/// ------
/// Closure
/// ------
///
/// ////////////////////////////


/// /////////////
/// Teil 1
/// /////////////

let names = ["Ford", "Zaphod", "Arthur", "Marvin", "Trillian"];

var sortedNames = names.sorted();

// Array absteigend sortieren

func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2;
}

sortedNames.sort(by: backward(_:_:));

// Array nach Wortlänge sortieren

func length(_ s1: String, _ s2: String) -> Bool {
    return s1.count < s2.count;
}

sortedNames.sort(by: length(_:_:));
sortedNames.sort(by: length);

// Closure

sortedNames.sort { s1, s2 in
    return s1.count > s2.count;
};

// kürzere Variante

sortedNames.sort(by: {$0 < $1} ); // Shouthead argument
sortedNames.sort(by: {$0.count < $1.count} );

// noch kürzer

sortedNames.sort(by: >);

let input = "Raketenstart";
let vovel: [Character] = ["a","e","i","o","u"];
var resultName = "";

input.map {
    if vovel.contains($0) == false {
        resultName.append($0);
    }
};

input.map {
    if !vovel.contains($0) {
        resultName.append($0);
    }
};

//: [Next](@next)
