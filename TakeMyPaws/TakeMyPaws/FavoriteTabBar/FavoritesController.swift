//
//  FavoritesController.swift
//  TakeMyPaws
//
//  Created by BUDLCIT on 2024. 02. 04..
//

import UIKit

class FavoritesController: UIViewController {
    
    @IBOutlet weak var favoritesCollection: UICollectionView!
    
    let viewModel = FavoritesViewModel()
    let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewModel()
        configureRefreshControl()
        favoritesCollection.register(UINib(nibName: "FavoritePetCell", bundle: nil), forCellWithReuseIdentifier: "FavoritePetCell")
        favoritesCollection.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.getFavoritesDetails()
        tabBarController?.tabBar.isHidden = false
    }
    
    func showPetDetail(petId: Int) {
        let coordinator = PetDetailsCoordinator(selectedId: petId,
                                                navigationController: navigationController ?? UINavigationController())
        coordinator.start()
    }
    
    // MARK: - ViewModelConfiguration
    func configureViewModel() {
        
        viewModel.getFavoritesDetails()
        viewModel.error = { errorMessage in
            print("Error: \(errorMessage)")
        }
        viewModel.success = {
            self.favoritesCollection.reloadData()
            self.refreshControl.endRefreshing()
            print(self.viewModel.favorites)
        }
    }
    
    // MARK: - Pull To Refresh
    
    func configureRefreshControl() {
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        favoritesCollection.addSubview(refreshControl)
    }
    
    @objc func refreshData() {
        viewModel.getFavoritesDetails()
    }
}

// MARK: - UIConfiguration

extension FavoritesController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.favorites.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoritePetCell", for: indexPath) as! FavoritePetCell
        let pet = viewModel.favorites[indexPath.item]
        
        cell.cellConfig(sheltersName: pet.shelterName ?? "", petsName: pet.nameEn ?? "", image: pet.imageOne ?? "")
        
        if viewModel.favorites[indexPath.item].gender == true {
            cell.genderConfiguration(gender: "male")
        } else {
            cell.genderConfiguration(gender: "female")
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        showPetDetail(petId: viewModel.favorites[indexPath.item].idNumber ?? 0)
    }
}
