//: [Previous](@previous)

import Foundation;

var greeting = "Hello, playground";
//var httpError: (code: Int, description: String);
var httpError = (code: 404, description: "Not found");
httpError.code;
httpError.description;
httpError.0;
httpError.1;

////////////////////////////////////////////////////////////
/// Referenzen übergeben
////////////////////////////////////////////////////////////

func swapNumbers(first: inout Int, second: inout Int) { // inout wichtig für Referenzübergabe
    var first = first;
    var second = second;
    let tmpFirst = first;
    first = second;
    second = tmpFirst;
}

var first = 42;
var second = 23;

swapNumbers(first: &first, second: &second); // & => übergibt Referenz

print(first);

//////////////////////////////
/// Early Exit
//////////////////////////////

let numberCode = "2342:3454:89789";

func decode(numberCode input: String) { // numberCode => argument label
    let elements = input.components(separatedBy: ":");
    guard elements.count > 0 else { return }; // guard = Schlüsselwort für early exit
    var intElements = [Int]();
    for element in elements {
        guard let intElement = Int(element) else { return };
        intElements.append(intElement)
    }
    print(intElements);
}

decode(numberCode: numberCode);

////////////////////////////////////////////////////////////
/// Nested Function
////////////////////////////////////////////////////////////

func deepThought(fromStart input: Int) -> Int {
    let result = 42;
    guard input != result else { return input };
    var input = input;
    
    func addOne(){
        input += 1;
    }
    
    func substractOne(){
        input -= 1;
    }
    
    while input != result {
        if (input < result ) {
            addOne();
        } else if ( input > result ) {
            substractOne();
        }
    }
    
    return input;
}

var sinn_des_lebens = deepThought(fromStart: 67);
print(sinn_des_lebens);
//: [Next](@next)
