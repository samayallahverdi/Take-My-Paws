//
//  HomePageController.swift
//  TakeMyPaws
//
//  Created by BUDLCIT on 2024. 01. 09..
//

import UIKit

class HomePageController: UIViewController {
    
    @IBOutlet weak var homeCollection: UICollectionView!
    
    let viewModel = HomePageViewModel()
    let postModel = PostModel()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeCollection.register(UINib(nibName: "HomePageCell", bundle: nil), forCellWithReuseIdentifier: "HomePageCell")
        configureViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
        //        viewModel.getHomeDetails()
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
        
    }
    
    // MARK: - SeeAllButton
    
    @IBAction func seeAllButtonTapped(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "SeeAllController") as! SeeAllController
        navigationController?.show(controller, sender: nil)
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
        
//        cell.viewModel = viewModel
        cell.petName.text = pet.nameEn
        cell.petImage.loadImage(url: pet.imageOne ?? "")
        cell.petAdress.text = pet.shelterName
        print("animal", viewModel.home[indexPath.item].isFavorite ?? true)
        
        
//         Button Configuration
        if viewModel.home[indexPath.item].isFavorite == true {
            cell.isFavorite = false
        }
        
        
        if viewModel.home[indexPath.item].gender == true {
            cell.gerderImage.image = UIImage(named: "male")
        } else {
            cell.gerderImage.image = UIImage(named: "female")
        }
        
//        Protocol Configuration
        cell.tag = indexPath.item
        cell.delegate = self
        
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "PetDetailsController") as! PetDetailsController
        controller.selectedId = viewModel.home[indexPath.item].idNumber ?? 0
        navigationController?.show(controller, sender: nil)
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

