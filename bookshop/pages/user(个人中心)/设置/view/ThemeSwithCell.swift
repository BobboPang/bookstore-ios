
import Foundation
import UIKit

class ThemeSwithCell: BaseCell {
    
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        label.theme_textColor = ThemeColorPicker(keyPath: "Global.textColor")
    }
    
}
