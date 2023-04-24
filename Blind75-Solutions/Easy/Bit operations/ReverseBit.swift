import Foundation


func reverseBits(_ n: Int) -> Int {
    var reversedInt = 0
    for i in 0 ..< 32 {
        let lsb = (n>>i) & 1
        reversedInt = reversedInt | (lsb << (31 - i))
    }
    return reversedInt
}



