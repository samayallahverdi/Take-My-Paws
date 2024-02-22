//
//  LatestNewsCell.swift
//  TakeMyPaws
//
//  Created by BUDLCIT on 2024. 02. 08..
//

import UIKit

class LatestNewsCell: UICollectionViewCell {

    @IBOutlet weak var latestNewsSource: UILabel!
    @IBOutlet weak var latestNewsTitle: UILabel!
    @IBOutlet weak var latestNewsImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    //    CellConfiguration
    func cellConfig(title: String, source: String, image:String){
        latestNewsImage.loadImage(url: image)
        latestNewsTitle.text = title
        latestNewsSource.text = source
    }
}
