
import Foundation
import UIKit

class SettingController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.theme_backgroundColor = ThemeColorPicker(keyPath: "Global.backgroundColor")
        tableView.theme_separatorColor = ThemeColorPicker(keyPath:"ListViewController.separatorColor")
        
        tableView.tableFooterView = UIView()
    }
}
