//
//  HomePageCell.swift
//  TakeMyPaws
//
//  Created by BUDLCIT on 2024. 01. 12..
//

import UIKit

protocol HomePageCellDelegate {
    func didTapFavoriteButton(index: Int, isFavorite: Bool)
}

class HomePageCell: UICollectionViewCell {

    @IBOutlet weak var petImage: UIImageView!
    @IBOutlet weak var petName: UILabel!
    @IBOutlet weak var petAdress: UILabel!
    @IBOutlet weak var gerderImage: UIImageView!
    @IBOutlet weak var favoriteButton: UIButton!
    
    var delegate: HomePageCellDelegate?

    var isFavorite: Bool = true {

           didSet {
               updateButtonAppearance()
           }
       }

    override func awakeFromNib() {
        super.awakeFromNib()
      
    }
      
      override func prepareForReuse() {
          super.prepareForReuse()
          isFavorite = true
          updateButtonAppearance()
      }
    
    func updateButtonAppearance() {
           if !isFavorite {
               favoriteButton.setImage(UIImage(named: "filledHeart"), for: .normal)
           } else {
               favoriteButton.setImage(UIImage(named: "heartButton"), for: .normal)
           }
       }

       @IBAction func favoriteButtonTapped(_ sender: Any) {
           isFavorite.toggle()
           delegate?.didTapFavoriteButton(index: self.tag, isFavorite: isFavorite)
          
       }
//    CellConfiguration
  func cellConfig(name: String, adress: String, image:String){
        petImage.loadImage(url: image)
        petName.text = name
        petAdress.text = adress
    }
//    GenderConfiguration
    func genderConfiguration(gender: String){
        gerderImage.image = UIImage(named: gender)
    }
   }
