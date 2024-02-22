//
//  MainNewsCell.swift
//  TakeMyPaws
//
//  Created by BUDLCIT on 2024. 02. 08..
//

import UIKit

class MainNewsCell: UICollectionViewCell {

    @IBOutlet weak var newsSource: UILabel!
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var newsImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    //    CellConfiguration
    func cellConfig(title: String, source: String, image:String){
        newsImage.loadImage(url: image)
        newsTitle.text = title
        newsSource.text = source
    }
}
