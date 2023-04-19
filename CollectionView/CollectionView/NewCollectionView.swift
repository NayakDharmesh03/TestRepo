//
//  NewCollectionView.swift
//  CollectionView
//
//  Created by NT 2 on 16/02/23.
//

import UIKit

class NewCollectionView: UIViewController {

    @IBOutlet var singleImage: UIImageView!
    @IBOutlet var imageName: UILabel!
    
    var sImage:UIImage!
    var sName:String!
    override func viewDidLoad() {
        super.viewDidLoad()

        singleImage.image = sImage
        imageName.text = sName
        // Do any additional setup after loading the view.
    }

}
