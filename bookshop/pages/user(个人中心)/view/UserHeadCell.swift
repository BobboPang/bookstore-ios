
import Foundation
import UIKit

class UserHeadCell: UITableViewCell {
    
    @IBOutlet weak var nicknameTextView: UITextView!
    @IBOutlet weak var descTextView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.theme_backgroundColor = ThemeColorPicker(keyPath: "Global.barTintColor")
        
        nicknameTextView.theme_textColor = ThemeColorPicker(keyPath: "Global.barTextColor")
        nicknameTextView.theme_backgroundColor = ThemeColorPicker(keyPath: "Global.barTintColor")
        
        descTextView.theme_textColor = ThemeColorPicker(keyPath: "Global.barTextColor")
        descTextView.theme_backgroundColor = ThemeColorPicker(keyPath: "Global.barTintColor")
    }
}
