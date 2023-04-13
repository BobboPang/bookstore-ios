
import Foundation
import UIKit

class GoodCollectionCell: FunctionCollectionCell {
    
    override func getTitle() -> String? {
        return "精品"
    }
    
    override func getIconImg() -> UIImage? {
        return UIImage(named: "jinxuan")
    }
}

