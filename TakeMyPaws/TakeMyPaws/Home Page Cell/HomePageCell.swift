//
//  HomePageCell.swift
//  TakeMyPaws
//
//  Created by BUDLCIT on 2024. 01. 12..
//

import UIKit

protocol HomePageCellDelegate {
    func didTapFavoriteButton(index: Int)
}


class HomePageCell: UICollectionViewCell {

    @IBOutlet weak var petImage: UIImageView!
    @IBOutlet weak var petName: UILabel!
    @IBOutlet weak var petAdress: UILabel!
    @IBOutlet weak var gerderImage: UIImageView!
    @IBOutlet weak var favoriteButton: UIButton!
    
    var delegate: HomePageCellDelegate?
    
    var isButtonTapped = true {
            didSet {
                updateButtonAppearance()
            }
        }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }
    
    func updateButtonAppearance() {
          if !isButtonTapped {
              favoriteButton.setImage(UIImage(systemName: "filledHeart"), for: .normal)
          } else {
              
              favoriteButton.setImage(UIImage(systemName: "heartButton"), for: .normal)
          }
      }

    
    @IBAction func favoriteButtonTapped(_ sender: Any) {
        isButtonTapped.toggle()
        delegate?.didTapFavoriteButton(index: self.tag)
        print(self.tag)
    }
    
}
