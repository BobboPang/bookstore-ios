import Foundation
import UIKit

class UserController: UITableViewController {
    
    @IBOutlet weak var nicknameTextView: UITextView!
    @IBOutlet weak var headImage: UIImageView!
    
    // 界面初始化
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
        headImage.layer.masksToBounds = true
        headImage.layer.cornerRadius = headImage.frame.width / 2
        headImage.contentMode = .scaleToFill
        
        // 注册监听器
        NotificationCenter.default.addObserver(self, selector: #selector(observerLoginSuccess),
                                               name: NSNotification.Name(rawValue:"loginSuccess"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(observerModifyInfo),
                                               name: NSNotification.Name(rawValue:"modifyInfo"), object: nil)
        
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = false
                
        viewDidLoadHelper()
    }
    
    // 界面初始化helper
    func viewDidLoadHelper(){
        if(CommonUtil.getUser() == nil) {
            print("用户未登录")
            nicknameTextView.text = "未登录"
            headImage.theme_image = ThemeImagePicker(keyPath: "userHeadCell.headImage")
        } else {
            let img = CommonUtil.getUser()?.img
            if(img == nil) {
                headImage.theme_image = ThemeImagePicker(keyPath: "userHeadCell.headImage")
            } else {
                headImage.image = img
            }
            nicknameTextView.text = CommonUtil.getUser()?.nickname
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                
        // 需要检查用户是否登录的section
        if(indexPath.section == 1 || indexPath.section == 2){
            if(CommonUtil.getUser() == nil) {
                CBToast.showToastAction(message: "用户未登录")
                return
            }
        } else {
            return
        }

        // 根据点击的条目打开对应的页面
        if(indexPath.section == 2) {
            if(indexPath.row == 0) {    // 打开地址
                self.performSegue(withIdentifier: "showAddressSegue", sender: nil)
            } else if (indexPath.row == 1){     // 打开个人资料
                self.performSegue(withIdentifier: "userInfoSegue", sender: nil)
            }
        } else {
            let vc = WebController()
            let navVC = UINavigationController(rootViewController: vc)
            let img = UIImageView(image: UIImage(named: "indevelopment"))
            vc.view.addSubview(img)
            img.frame = CGRect(x: SCREEN_WIDTH / 4, y: SCREEN_WIDTH / 4, width: SCREEN_WIDTH / 2, height: SCREEN_WIDTH / 2)
            present(navVC, animated: true, completion: nil)
        }
    }
    
    // 点击头像区域跳转登录界面
    @IBAction func login(_ sender: UITapGestureRecognizer) {
        if(CommonUtil.getUser() == nil) {
            print("用户未登录，进入登录页面")
            self.performSegue(withIdentifier: "loginSegue", sender: nil)
        }
    }
    
    // 监听登录成功的通知，重新加载页面
    @objc func observerLoginSuccess(){
        print("监听到loginSuccess通知")
        viewDidLoadHelper()
    }
    
    // 监听资料修改的通知，重新加载页面
    @objc func observerModifyInfo() {
        print("监听到ModifyInfo通知")
        viewDidLoadHelper()
    }
    
    // 退出登录，重新加载页面
    @IBAction func quitLogin(_ segue: UIStoryboardSegue){
        print("退出登录")
        CommonUtil.quitLogin()
        viewDidLoadHelper()
    }
    
    deinit {
        // 取消通知
        NotificationCenter.default.removeObserver(self)
    }
}
