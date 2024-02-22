//
//  HomePageController.swift
//  TakeMyPaws
//
//  Created by BUDLCIT on 2024. 01. 09..
//

import UIKit

class HomePageController: UIViewController {
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var homeCollection: UICollectionView!
    
    let viewModel = HomePageViewModel()
    let postModel = PostModel()
    let searchViewModel = SearchViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeCollection.register(UINib(nibName: "HomePageCell", bundle: nil), forCellWithReuseIdentifier: "HomePageCell")
        configureViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
        viewModel.home.removeAll()
        configureViewModel()
    }
    // MARK: - Coordinator Configuration
    func showPetDetail(petId: Int) {
        let coordinator = PetDetailsCoordinator(selectedId: petId,
                                                 navigationController: navigationController ?? UINavigationController())
        coordinator.start()
    }
    func seeAllPets(){
        let seeAllCoordinator = SeeAllPageCoordinator(navigationController: navigationController ?? UINavigationController())
        
        seeAllCoordinator.start()
    }
    
    // MARK: - ViewModelConfiguration
    
    func configureViewModel() {
        
        viewModel.getHomeDetails()
        viewModel.error = { errorMessage in
            print("Error: \(errorMessage)")
        }
        viewModel.success = {
            
            self.homeCollection.reloadData()
        }
    }
    // MARK: - SearchTextField
    @IBAction func searchTextField(_ sender: UITextField) {
        
        if let text = sender.text, !text.isEmpty {
            searchViewModel.search(key: text)
            viewModel.home = searchViewModel.searchPets
        } else {
            
            viewModel.home = []
            viewModel.getHomeDetails()
        }
        
        homeCollection.reloadData()
    }
    
    // MARK: - SeeAllButton
    
    @IBAction func seeAllButtonTapped(_ sender: Any) {
        seeAllPets()
    }
}

    // MARK: - UIConfiguration

extension HomePageController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.home.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomePageCell", for: indexPath) as! HomePageCell
        let pet = viewModel.home[indexPath.item]
        
        cell.cellConfig(name: pet.nameEn ?? "", adress: pet.shelterName ?? "", image: pet.imageOne ?? "")
        
        //         Button Configuration
        if viewModel.home[indexPath.item].isFavorite == true {
            cell.isFavorite = false
        }
        
        
        if viewModel.home[indexPath.item].gender == true {
            cell.genderConfiguration(gender: "male")
        } else {
            cell.genderConfiguration(gender: "female")
        }
        
        //        Protocol Configuration
        cell.tag = indexPath.item
        cell.delegate = self
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        showPetDetail(petId: viewModel.home[indexPath.item].idNumber ?? 0)
    }
}
    // MARK: - Protocol

extension HomePageController: HomePageCellDelegate {
    func didTapFavoriteButton(index: Int, isFavorite: Bool) {
        let petId = viewModel.home[index].idNumber ?? 0
        
        if isFavorite {
            postModel.deleteFavorite(petId: petId, fullName: "samaya")
        } else {
            postModel.postFavorite(petId: petId, fullName: "samaya")
            
        }
    }
}

