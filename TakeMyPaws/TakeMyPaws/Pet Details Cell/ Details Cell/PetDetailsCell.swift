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
           // Diğer bilgileri güncelleme işlemleri...
           
           if let isMale = info.gender {
               petGender.text = isMale ? "Male" : "Female"
           } else {
               petGender.text = ""
           }
       }
   }

