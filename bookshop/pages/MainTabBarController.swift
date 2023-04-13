
import Foundation
import UIKit

class MainTabBarController: UITabBarController {
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        switch item.tag {
        case 1:
            NotificationCenter.default.post(name: NSNotification.Name("refreshShoppingCar"), object: nil)
            break
        default:
            break
        }
    }
}
