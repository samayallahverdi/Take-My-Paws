//
//  SeeAllController.swift
//  TakeMyPaws
//
//  Created by BUDLCIT on 2024. 01. 29..
//

import UIKit

class SeeAllController: UIViewController {
    
    
    @IBOutlet weak var seeAllCollection: UICollectionView!
    
    var viewModel = SeeAllPageViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        seeAllCollection.register(UINib(nibName: "HomePageCell", bundle: nil), forCellWithReuseIdentifier: "HomePageCell")
        configureViewModel()
//        self.tabBarController?.tabBar.isHidden = true
        
    }
    func configureViewModel() {
        
        viewModel.getPetDetails()
        viewModel.error = { errorMessage in
            print("Error: \(errorMessage)")
        }
        viewModel.success = {
            self.seeAllCollection.reloadData()
        }
    }
}

extension SeeAllController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.pets.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomePageCell", for: indexPath) as! HomePageCell
        let pet = viewModel.pets[indexPath.item]
        cell.petName.text = pet.nameEn
        cell.petImage.loadImage(url: pet.imageOne ?? "")
        cell.petAdress.text = pet.shelterName

        if viewModel.pets[indexPath.item].gender == true {
            cell.gerderImage.image = UIImage(named: "male")
        } else {
            cell.gerderImage.image = UIImage(named: "female")
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "PetDetailsController") as! PetDetailsController
        controller.selectedId = viewModel.pets[indexPath.item].idNumber ?? 0
        print(viewModel.pets[indexPath.item].idNumber ?? 0)
        navigationController?.show(controller, sender: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
          .init(width: collectionView.frame.width/2-10, height: 315)
      }
}
