//
//  ViewController.swift
//  CollectionView
//
//  Created by NT 2 on 15/02/23.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet var collectionview: UICollectionView!
    static var count = 0
    var DataNames:[String] = ["Rita",
                              "Vikash",
                              "Vimal",
                              ]
    
    var postImages:[String ] = ["marguerite","flowers","lotus"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let width = (view.frame.width-20)/3
//                let layout = collectionview.collectionViewLayout as! UICollectionViewFlowLayout
//                layout.itemSize = CGSize(width: width, height: width)
        
    }


}
extension ViewController : UICollectionViewDelegateFlowLayout{
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//           return CGSize(width: collectionview.frame.width / 3 - 10, height:collectionview.frame.width / 3 - 10)
//       }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let Size = (collectionview.frame.size.width-10)
        return CGSize(width: Size, height: Size)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
//MARK
extension ViewController : UICollectionViewDelegate, UICollectionViewDataSource{
    
     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        let cell = collectionview.cellForItem(at: indexPath) as! MyCollectionViewCell
        
        cell.likeImage.image = UIImage(named: "selected")
//        cell.likeCount.text = String(ViewController.count+1)
    }

//     func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath){
//        let cell = collectionview.cellForItem(at: indexPath) as! MyCollectionViewCell
//
//        cell.likeImage.image = UIImage(named: "unselected")
//    }
    
   
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DataNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionview.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MyCollectionViewCell
        
        cell.myImages.image = UIImage(named: DataNames[indexPath.row])
        cell.nameLabel.text = DataNames[indexPath.row]
        cell.postImage.image = UIImage(named: postImages[indexPath.row])
        
        cell.myImages.layer.cornerRadius = 34
        cell.myImages.layer.borderWidth = 2
        cell.myImages.layer.borderColor = CGColor.init(gray: 5, alpha: 1)
        
        return cell
    }
    
    
}

