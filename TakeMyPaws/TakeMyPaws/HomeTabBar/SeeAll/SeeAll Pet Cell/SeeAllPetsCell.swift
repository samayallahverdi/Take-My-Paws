//
//  SeeAllPetsCell.swift
//  TakeMyPaws
//
//  Created by BUDLCIT on 2024. 02. 06..
//

import UIKit

class SeeAllPetsCell: UICollectionViewCell {
    
    @IBOutlet weak var genderImage: UIImageView!
    @IBOutlet weak var shelterNameLabel: UILabel!
    @IBOutlet weak var petNameLabel: UILabel!
    @IBOutlet weak var petImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    //    CellConfiguration
    func cellConfig(petName: String, shelterName: String, image:String){
        petImage.loadImage(url: image)
        shelterNameLabel.text = shelterName
        petNameLabel.text = petName
    }
    //    GenderConfiguration
    func genderConfiguration(gender: String){
        genderImage.image = UIImage(named: gender)
    }    
}
