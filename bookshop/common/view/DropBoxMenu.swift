
import Foundation
import UIKit

class DropBoxMenu: DropBoxView {
    
    override init(frame: CGRect, maxHeight: CGFloat = 200, delegate: DropBoxDelegate) {
        super.init(frame: frame, maxHeight: maxHeight, delegate: delegate)
        
        layer.cornerRadius = 5
        backgroundColor = .white
        
        register(MenuCell.classForCoder(), forCellReuseIdentifier: "menuCell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dropBoxDelegate.count()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath) as? MenuCell
        let text = dropBoxDelegate.setItem(indexPath.row)["text"] as! String
        let img = dropBoxDelegate.setItem(indexPath.row)["img"] as! UIImage
        cell?.setImg(img: img)
        cell?.setLabel(text: text)
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return dropBoxDelegate.heightForItem(indexPath.row)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        drawUp()
        return dropBoxDelegate.didSelectItemAt(indexPath.row)
    }
    
    // 计算实际内容高度，本例为 item个数 * item高度 + header高度 + footer高度
    override func caculateContentHeight() -> CGFloat {
        return CGFloat(dropBoxDelegate.count()) * dropBoxDelegate.heightForItem(0) + 1 + 1
    }
    
}

class MenuCell: UITableViewCell {
    
    var imgView: UIImageView!
    var label: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        
        imgView = UIImageView(frame: CGRect(x: 15, y: 10, width: 20, height: 20))
        imgView.contentMode = .scaleToFill
        addSubview(imgView)
        
        label = UILabel(frame: CGRect(x: 50, y: 5, width: self.frame.width - 50, height: 30))
        label.font = UIFont.systemFont(ofSize: 15)
        addSubview(label)
    }
    
    func setImg(img: UIImage) {
        imgView.image = img
    }
    
    func setLabel(text: String) {
        label.text = text
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
