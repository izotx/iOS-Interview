import UIKit
/*
 In this example, we will encrypt a String using a onetime
 pad. One way of thinking
 about a Swift String is as a sequence of UTF8
 bytes (with UTF8
 being a Unicode
 character encoding)
 */

var str = "Hello, playground"
typealias OTPKey = [UInt8]
typealias OTPKeyPair = (key1: OTPKey, key2: OTPKey)


/*
 Original Data + Dummy Data Encryption>
 KeyPair
 (Dummy Data, Product)
 Decryption>
 Original Data
 */

func encryptString(string:String)->OTPKeyPair{
    var dummy = randomOTPKey(length: string.count)
    var encrypted = Array<UInt8>(repeating: 0, count: string.count)
    for (i,c) in dummy.enumerated(){
        encrypted[i] = c ^ string.utf8[string.utf8.index(string.utf8.startIndex, offsetBy:i)]
    }
    return (encrypted, dummy)
}

func decrypt(pair:OTPKeyPair)->String?{
    var dummy = pair.key2
    var encrypted = pair.key1
    var decryptedArray = Array<UInt8>(repeating: 0, count: pair.key1.count)
    for (i,c) in encrypted.enumerated(){
        decryptedArray[i] = c ^ dummy[i]
    }
    
    return String(bytes: decryptedArray, encoding: .utf8)
}




func randomOTPKey(length:Int)->OTPKey{
    var key = OTPKey()
    for _ in 0..<length{
        let k =  UInt8(arc4random_uniform(UInt32(UInt8.max)))
        key.append(k)
    }
    return key
}

let keyPair = encryptString(string: str)
decrypt(pair: keyPair)
