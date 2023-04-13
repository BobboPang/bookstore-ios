
import Foundation
import UIKit

class ActivityCollectionCell: FunctionCollectionCell {
    
    override func getTitle() -> String? {
        return "活动"
    }
    
    override func getIconImg() -> UIImage? {
        return UIImage(named: "activity")
    }
}
