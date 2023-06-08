import Cocoa;
import SwiftUI;

var alphabet = [1: "a",
                2: "b",
                3: "c",
                4: "d",
                5: "e",
                6: "f",
                7: "g",
                8: "h",
                9: "i",
                10: "j",
                11: "k",
                12: "l",
                13: "m",
                14: "n",
                15: "o",
                16: "p",
                17: "q",
                18: "r",
                19: "s",
                20: "t",
                21: "u",
                22: "v",
                23: "w",
                24: "x",
                25: "y",
                26: "z",
];

var alphabetCrypt = ["a": 1,
                "b": 2,
                "c": 3,
                "d": 4,
                "e": 5,
                "f": 6,
                "g": 7,
                "h": 8,
                "i": 9,
                "j": 10,
                "k": 11,
                "l": 12,
                "m": 13,
                "n": 14,
                "o": 15,
                "p": 16,
                "q": 17,
                "r": 18,
                "s": 19,
                "t": 20,
                "u": 21,
                "v": 22,
                "w": 23,
                "x": 24,
                "y": 25,
                "z": 26,
];


var inputText = ["h","a","l","l","o"];

var 🌕 = "Sonne";

var inputCrypted = "f";

// Aufrufe und Weiteres

var indexFromInput = inputText.count;
var index = 0;

for text in inputText {
    var letter = text; // Konstante wird zur Variablen
    
    var anzahl_der_verschiebungen = alphabetCrypt[inputCrypted]; // Zahl zum Verschieben
    
    var zahl_des_buchstabens: Int; // Buchstabe als Zahl
    
    if let tmp = Int(alphabetCrypt[letter]!) {
       zahl_des_buchstabens = alphabetCrypt[letter]!;
    }
    
    print(zahl_des_buchstabens);
}
print(🌕);


// 1. Verschlüsseln
// 2. Entschlüsseln
// 3. Bruteforce - Welcher Schlüssel wurde genommen?
