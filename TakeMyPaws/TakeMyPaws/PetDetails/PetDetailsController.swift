//
//  PetDetailsController.swift
//  TakeMyPaws
//
//  Created by BUDLCIT on 2024. 01. 29..
//

import UIKit

class PetDetailsController: UIViewController {
    
    var selectedId = 0
    let viewModel = PetDetailsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewModel()
    }
    
    func configureViewModel() {
        
        viewModel.getPetInfoItems(petId: selectedId)
        viewModel.error = { errorMessage in
            print("Error: \(errorMessage)")
        }
        viewModel.success = {
            print(self.viewModel.petDetails)
            
        }
    }
}
extension PetDetailsController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.petDetails.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
}
