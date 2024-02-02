//
//  HomePageController.swift
//  TakeMyPaws
//
//  Created by BUDLCIT on 2024. 01. 09..
//

import UIKit
import RealmSwift

class HomePageController: UIViewController {
    
    @IBOutlet weak var homeCollection: UICollectionView!
    
    let realm = try! Realm()
    var DB = DataBase()
    let viewModel = HomePageViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeCollection.register(UINib(nibName: "HomePageCell", bundle: nil), forCellWithReuseIdentifier: "HomePageCell")
        
        configureViewModel()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
    }
    
    func configureViewModel() {
        
        viewModel.getHomeDetails()
        viewModel.error = { errorMessage in
            print("Error: \(errorMessage)")
        }
        viewModel.success = {
            self.homeCollection.reloadData()
        }
    }
    
    @IBAction func searchTextField(_ sender: UITextField) {
        //           if let text = sender.text {
        //        viewModel.search(key: text)
        //    } else {
        //        viewModel.home.removeAll()
        //    }
        //        // viewModel.success kapanı
        //        viewModel.success = {
        //            self.homeCollection.reloadData()
        //        }
    }
    
    
    
    
    @IBAction func seeAllButtonTapped(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "SeeAllController") as! SeeAllController
        navigationController?.show(controller, sender: nil)
    }
}
extension HomePageController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.home.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomePageCell", for: indexPath) as! HomePageCell
        let pet = viewModel.home[indexPath.item]
        cell.petName.text = pet.nameEn
        cell.petImage.loadImage(url: pet.imageOne ?? "")
        cell.petAdress.text = pet.shelterName
        
        if viewModel.home[indexPath.item].gender == true {
            cell.gerderImage.image = UIImage(named: "male")
        } else {
            cell.gerderImage.image = UIImage(named: "female")
        }
        
        //        cell.tag = indexPath.item
        //        cell.delegate = self
        //
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "PetDetailsController") as! PetDetailsController
        controller.selectedId = viewModel.home[indexPath.item].idNumber ?? 0
        navigationController?.show(controller, sender: nil)
    }
}
extension HomePageController: HomePageCellDelegate {
    func didTapFavoriteButton(index: Int) {
        //        let selectedPet = viewModel.home[index].nameEn
        //
        //        if let selectedPetName = selectedPet {
        //
        //            if let existingFavorite = realm.objects(FavoritePets.self).filter("petName = %@", selectedPetName).first {
        //                try! realm.write {
        //                    realm.delete(existingFavorite)
        //                }
        //            } else {
        //                let newFavorite = FavoritePets()
        //                newFavorite.petName = selectedPetName
        //                try! realm.write {
        //                    realm.add(newFavorite)
        //
        //                }
        //            }
        //
        //        }
    }
}
