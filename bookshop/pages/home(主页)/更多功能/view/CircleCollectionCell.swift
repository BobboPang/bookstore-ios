
import Foundation
import UIKit

class CircleCollectionCell: FunctionCollectionCell {
    
    override func getTitle() -> String? {
        return "圈子"
    }
    
    override func getIconImg() -> UIImage? {
        return UIImage(named: "earth")
    }
}
