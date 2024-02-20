//
//  SheltersCell.swift
//  TakeMyPaws
//
//  Created by BUDLCIT on 2024. 02. 14..
//

import UIKit

class SheltersCell: UICollectionViewCell {

    @IBOutlet weak var shelterImage: UIImageView!
    @IBOutlet weak var shelterName: UILabel!
    @IBOutlet weak var shelterAdressLabel: UILabel!
    @IBOutlet weak var shelterDescription: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func cellConfiguration(name: String, adress: String, description: String ) {
        shelterName.text = name
        shelterDescription.text = description
        shelterAdressLabel.text = adress
    }

}
