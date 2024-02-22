//
//  FavoritePetCell.swift
//  TakeMyPaws
//
//  Created by BUDLCIT on 2024. 02. 04..
//

import UIKit

class FavoritePetCell: UICollectionViewCell {
    
    @IBOutlet weak var genderImage: UIImageView!
    @IBOutlet weak var shelterName: UILabel!
    @IBOutlet weak var petName: UILabel!
    @IBOutlet weak var petImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    //    CellConfiguration
    func cellConfig(sheltersName: String, petsName: String, image:String){
        petImage.loadImage(url: image)
        shelterName.text = sheltersName
        petName.text = petsName
    }
    //    GenderConfiguration
    func genderConfiguration(gender: String){
        genderImage.image = UIImage(named: gender)
    }
}
