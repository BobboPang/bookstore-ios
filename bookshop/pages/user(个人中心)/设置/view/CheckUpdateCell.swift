
import Foundation
import UIKit

class CheckUpdateCell: BaseCell {
    
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        label.theme_textColor = ThemeColorPicker(keyPath: "Global.textColor")
    }
}
