
import Foundation
import AVKit

class CircleController: UICollectionViewController, WaterFallDelegate {

    var videoUrl: [Video] = CommonUtil.getVideoList()
    var layout: WaterFallLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backBtn = UIBarButtonItem(image: ImageUtil.resize(image: UIImage(named: "back")!, size: CGSize(width: 20, height: 20)),
                                      style: .plain, target: self, action: #selector(back))
        navigationItem.setLeftBarButton(backBtn, animated: true)
        navigationItem.title = "圈子"
        
        let playbill = UIImageView(image: UIImage(named: "video_playbill"))
        playbill.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_WIDTH * 2 / 3)
        
        //创建瀑布流视图布局类
        layout = WaterFallLayout(delegate: self, yOffset: SCREEN_WIDTH * 2 / 3)
        layout.minimumInteritemSpacing = 5
        //创建集合视图
        collectionView.collectionViewLayout = layout
        //注册载体数据类
        collectionView.register(CircleCell.classForCoder(), forCellWithReuseIdentifier: "videoCell")
        
        collectionView.backgroundColor = ColorUtil.use255Color(red: 250, green: 250, blue: 250, alpha: 1)
        
        collectionView.addSubview(playbill)
    }
    
    func getCount() -> Int {
        return videoUrl.count
    }
    
    // 根据cell的内容动态设置item高度
    func heightFotItem(index: Int) -> CGFloat {
        var h: CGFloat = 0.0
        // 头像高度
        h += 20
        // 时间高度
        h += 20
        // 封面高度
        h += self.layout.getItemWidth()*3/5
        // 标题高度
        h += MultilineLabel.caculateHeight(width: self.layout.getItemWidth() - 10, fontOfSize: 14, textStr: videoUrl[index].title!, lineSpacing: 5)
        // 摘要高度
//        h += MultilineLabel.caculateHeight(width: self.layout.getItemWidth() - 10, fontOfSize: 12, textStr: videoUrl[index].desc!, lineSpacing: 5)
        // 图标高度
        h += 20
        // 总间隔高度
        h += 45
        return h
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videoUrl.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "videoCell", for: indexPath) as!  CircleCell
        cell.video = videoUrl[indexPath.row]
        cell.initCell()
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let player = AVPlayer(url: NSURL(string: videoUrl[indexPath.row].url!)! as URL)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
        self.present(playerViewController, animated:true, completion: nil)
    }
    
    @objc func back() {
        dismiss(animated: true, completion: nil)
    }
 
}
