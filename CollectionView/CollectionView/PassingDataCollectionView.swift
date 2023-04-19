//
//  PassingDataCollectionView.swift
//  CollectionView
//
//  Created by NT 2 on 16/02/23.
//

import UIKit

class PassingDataCollectionView: UIViewController {

    @IBOutlet var collectionview: UICollectionView!
    fileprivate var longPressGesture: UILongPressGestureRecognizer!
    
    var imageNames:[String] = ["Rita",
                              "Vikash",
                              "Vimal",
                              "Rohit",
                              "Raami",
                              "Kavya",
                              "Dhaval",
                              "unselected",
                              "flowers",
                              "lotus",
                              "selected",
                              "marguerite"
                              ]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Hello this is repo Github Project")
        longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(self.handleLongGesture(gesture:)))
        collectionview.addGestureRecognizer(longPressGesture)
    }
    
    @objc func handleLongGesture(gesture: UILongPressGestureRecognizer) {
            switch(gesture.state) {

            case .began:
                guard let selectedIndexPath = collectionview.indexPathForItem(at: gesture.location(in: collectionview)) else {
                    break
                }
                collectionview.beginInteractiveMovementForItem(at: selectedIndexPath)
            case .changed:
                collectionview.updateInteractiveMovementTargetPosition(gesture.location(in: gesture.view!))
            case .ended:
                collectionview.endInteractiveMovement()
            default:
                collectionview.cancelInteractiveMovement()
            }
        }

    

}
extension PassingDataCollectionView : UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let Size = (collectionview.frame.size.width-10)/3 - 5
        return CGSize(width: Size, height: Size)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
}
extension PassingDataCollectionView : UICollectionViewDelegate{
    
    //moving cell (canMoveItemAt)
    func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    //moving cell (moveItemAt)
    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        // select and delete sourceIndexPath
        let item = imageNames.remove(at: sourceIndexPath.item)
        
        // drag and insert at destinationIndexPath
        imageNames.insert(item, at: destinationIndexPath.item)
        print(imageNames)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedData:NewCollectionView = self.storyboard?.instantiateViewController(withIdentifier: "NewCollectionView") as! NewCollectionView
        
        selectedData.sImage = UIImage(named: imageNames[indexPath.row])
        selectedData.sName = imageNames[indexPath.row]
        self.navigationController?.pushViewController(selectedData, animated: true)
    }
}
extension PassingDataCollectionView : UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return imageNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         
        let cell = collectionview.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! PassingDataCell
        
        cell.gallaryImage.image = UIImage(named: imageNames[indexPath.row])
        cell.labelName.text = imageNames[indexPath.row]
        cell.layer.cornerRadius = 20
        cell.layer.borderWidth = 1
        return cell
    
    }
    
    
}
