
import Foundation

class StringUtil {
    
    class func isEmpty(str: String?) -> Bool {
        return str == nil || str!.count <= 0
    }
}
