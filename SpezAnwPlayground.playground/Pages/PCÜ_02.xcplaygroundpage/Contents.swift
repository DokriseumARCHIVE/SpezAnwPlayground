//: [Previous](@previous)

import Foundation;

var greeting = "Guten Tag!";

greeting[greeting.startIndex];
greeting[greeting.index(before: greeting.endIndex)];
greeting[greeting.index(after: greeting.startIndex)];

let index = greeting.index(greeting.startIndex, offsetBy: 7);
greeting[index];

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/// --------
/// Aufgabe 1:
/// --------
///
/// Schreibe unverschlüsselten Text als Parameter übergeben.
/// Rückgabe ist verschlüsselter Text.
/// Berechnung erfolgt innerhalb einer Funktion.
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

//var alphabet: [Character] = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"];
let alphabet = "abcdefghijklmnopqrstuvwxyz";
let key = 3;
let originalText = "Dies ist ein Text";
var cipherTextString = ""; // Ausgabe: glhv lvw hlq whAw

for char in originalText.lowercased() {
    
    if char.isWhitespace {
        cipherTextString += " ";
    }
    if let charIdx = (alphabet.firstIndex(of: char)) {
//        print("charIdx: ");
//        print(type(of: charIdx));
        let position = alphabet.distance(from: alphabet.startIndex, to: charIdx); // macht ausm Alphabet einen Integer zum rechnen
//        print("position: ");
//        print(type (of: position));
        let cipherIdx = (position + key) % alphabet.count;
        print("cipherIdx: " + String(cipherIdx));
        print("char: " + String(char));
        
        let index = alphabet.index(alphabet.startIndex, offsetBy: cipherIdx);
        //print(type(of: index));
        print("alphabet[index]: " + String(alphabet[index]));
        cipherTextString += String(alphabet[index]);
        
        print();
    }
}

print("Start cipherTextString: ");
print (cipherTextString)
print("Ende cipherTextString: ");


//: [Next](@next)
