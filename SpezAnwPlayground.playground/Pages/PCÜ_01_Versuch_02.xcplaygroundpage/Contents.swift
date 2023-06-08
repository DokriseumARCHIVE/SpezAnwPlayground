func caesarEncrypt(_ plaintext: String, shift: Int) -> String {
    let alphabet = "abcdefghijklmnopqrstuvwxyz"
    var ciphertext = ""
    
    for character in plaintext.lowercased() {
        if let index = alphabet.firstIndex(of: character) {
            let shiftedIndex = alphabet.index(alphabet.startIndex, offsetBy: (alphabet.distance(from: alphabet.startIndex, to: index) + shift) % 26)
            ciphertext.append(alphabet[shiftedIndex])
        } else {
            ciphertext.append(character)
        }
    }
    
    return ciphertext
}

func caesarDecrypt(_ ciphertext: String, shift: Int) -> String {
    return caesarEncrypt(ciphertext, shift: -shift)
}


let plaintext = "Hallo Welt!"
let shift = 3

let ciphertext = caesarEncrypt(plaintext, shift: shift)
print(ciphertext) // gibt "kdoorzhog!" aus

let decryptedPlaintext = caesarDecrypt(ciphertext, shift: shift)
print(decryptedPlaintext) // gibt "hallo welt!" aus
