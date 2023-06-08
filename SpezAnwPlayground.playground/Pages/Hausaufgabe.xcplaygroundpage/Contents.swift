import Foundation


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/// --------
/// Aufgabe 1:
/// --------
///
/// Schreiben Sie eine Funktion, die eine Text mit dem Caesars Cipher verschlüsselt, mit Hilfe der map Funktion.
/// Legen Sie dafür eine Playground an und lösen Sie dort die Aufgabe. Die Lösung laden Sie als zip-Datei bei Moodle hoch.
/// 
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
