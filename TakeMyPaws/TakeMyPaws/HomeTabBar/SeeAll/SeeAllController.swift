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
        seeAllCollection.register(UINib(nibName: "SeeAllPetsCell", bundle: nil), forCellWithReuseIdentifier: "SeeAllPetsCell")
        configureViewModel()
        title = "See all"
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
    func showPetDetail(petId: Int) {
        let coordinator = PetDetailsCoordinator(selectedId: petId,
                                                 navigationController: navigationController ?? UINavigationController())
        coordinator.start()
    }

}

extension SeeAllController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.pets.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SeeAllPetsCell", for: indexPath) as! SeeAllPetsCell
        let pet = viewModel.pets[indexPath.item]
        cell.cellConfig(petName: pet.nameEn ?? "", shelterName: pet.shelterName ?? "", image: pet.imageOne ?? "")

        if viewModel.pets[indexPath.item].gender == true {
            cell.genderConfiguration(gender: "male")
        } else {
            cell.genderConfiguration(gender: "female")
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        showPetDetail(petId: viewModel.pets[indexPath.item].idNumber ?? 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
          .init(width: collectionView.frame.width/2-10, height: 260)
      }
}
