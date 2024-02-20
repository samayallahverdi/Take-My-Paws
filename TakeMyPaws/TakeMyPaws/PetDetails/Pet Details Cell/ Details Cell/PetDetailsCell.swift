//
//  PetDetailsCell.swift
//  TakeMyPaws
//
//  Created by BUDLCIT on 2024. 01. 11..
//

import UIKit

class PetDetailsCell: UICollectionViewCell {
    
    @IBOutlet weak var petEnergy: UILabel!
    @IBOutlet weak var petGender: UILabel!
    @IBOutlet weak var petSize: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(withInfo info: PetInfo) {
        
        if let isMale = info.gender {
            petGender.text = isMale ? "Male" : "Female"
        } else {
            petGender.text = ""
        }
        
        if let age = info.age {
            petEnergy.text = "\(age)"
        } else {
            petEnergy.text = "Age: N/A"
        }
        
        if let sizes = info.size, !sizes.isEmpty {
            let sizesText = sizes.joined(separator: ", ")
            petSize.text = "\(sizesText)"
        } else {
            petSize.text = "Size: N/A"
        }
    }
    
    
}

