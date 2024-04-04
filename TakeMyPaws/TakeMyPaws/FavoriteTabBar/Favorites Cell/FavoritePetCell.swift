//
//  FavoritePetCell.swift
//  TakeMyPaws
//
//  Created by BUDLCIT on 2024. 02. 04..
//

import UIKit

protocol FavoritesPageCellDelegate {
    func didTapUnSaveButton(index: Int, isFavorite: Bool)
}

class FavoritePetCell: UICollectionViewCell {
    
    @IBOutlet weak var unSaveButton: UIButton!
    @IBOutlet weak var genderImage: UIImageView!
    @IBOutlet weak var shelterName: UILabel!
    @IBOutlet weak var petName: UILabel!
    @IBOutlet weak var petImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    var delegate: FavoritesPageCellDelegate?

    var isFavorite: Bool = true {

           didSet {
               updateButtonAppearance()
           }
       }

      override func prepareForReuse() {
          super.prepareForReuse()
          isFavorite = true
          updateButtonAppearance()
      }
    
    func updateButtonAppearance() {
           if !isFavorite {
               unSaveButton.setImage(UIImage(named: "heartButton"), for: .normal)
           } else {
               unSaveButton.setImage(UIImage(named: "filledHeart"), for: .normal)
           }
       }
//    UnSaveButton
    @IBAction func unSaveButtonClicked(_ sender: Any) {
        isFavorite.toggle()
        delegate?.didTapUnSaveButton(index: self.tag, isFavorite: isFavorite)
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
