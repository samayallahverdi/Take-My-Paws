//
//  ShelterController.swift
//  TakeMyPaws
//
//  Created by BUDLCIT on 2024. 02. 14..
//

import UIKit

class ShelterController: UIViewController {
    
    @IBOutlet weak var shelterCollection: UICollectionView!
    
    var viewModel = SheltersViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewModel()
        cellRegister()
    }
}

// MARK: - UIConfiguration

extension ShelterController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.shelters.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SheltersCell", for: indexPath) as! SheltersCell
        let shelter = viewModel.shelters[indexPath.item]

        cell.cellConfiguration(name: shelter.name ?? "", adress: shelter.address ?? "", description: shelter.description ?? "", image: shelter.image ?? "")
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        AlertFunction.showAlert(view: self, title: "Contact", message: viewModel.shelters[indexPath.item].contact ?? "")
        
    }
}

// MARK: - ConfigurationFunctions

extension ShelterController {
    
    func configureViewModel() {
        viewModel.getShelterDetails()
        viewModel.error = { errorMessage in
            print("Error: \(errorMessage)")
        }
        viewModel.success = {
            self.shelterCollection.reloadData()
        }
    }
    
    func cellRegister(){
        shelterCollection.register(UINib(nibName: "SheltersCell", bundle: nil), forCellWithReuseIdentifier: "SheltersCell")
    }
}

