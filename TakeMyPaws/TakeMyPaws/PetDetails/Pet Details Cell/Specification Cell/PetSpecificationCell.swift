//
//  PetSpecificationCell.swift
//  TakeMyPaws
//
//  Created by BUDLCIT on 2024. 02. 02..
//

import UIKit

class PetSpecificationCell: UICollectionViewCell {

    @IBOutlet weak var friendlyLabel: UILabel!
    @IBOutlet weak var houseTrainedLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    func configSpecification(friendly: String, trained: String){
        friendlyLabel.text = friendly
        houseTrainedLabel.text = trained
    }
}
