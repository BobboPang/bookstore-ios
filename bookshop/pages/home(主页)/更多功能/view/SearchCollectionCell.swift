
import Foundation
import UIKit

// 搜索功能
class SearchCollectionCell: FunctionCollectionCell {
    
    override func getTitle() -> String? {
        return "搜索"
    }
    
    override func getIconImg() -> UIImage? {
        return UIImage(named: "search")
    }
    
}
