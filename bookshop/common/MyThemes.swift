
import Foundation

enum MyThemes: String {
    
    case red    = "Red"
    case night  = "Night"
    case blue   = "Blue"
    case green  = "Green"
    case yellow = "Yellow"
    
    static func switchTo(_ theme: MyThemes) {
        UserDefaults.AppInfo.set(value: theme.rawValue, forKey: .themeStyle)
        ThemeManager.setTheme(plistName: theme.rawValue, path: .mainBundle)
    }
    
}
