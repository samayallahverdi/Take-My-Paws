//
//  PetDetailsController.swift
//  TakeMyPaws
//
//  Created by BUDLCIT on 2024. 01. 29..
//

import UIKit
import RealmSwift

class PetDetailsController: UIViewController {
    
    let realm = try! Realm()
    var DB = DataBase()
    
    var selectedId = 0
    let viewModel = PetDetailsViewModel()
   
    
    @IBOutlet weak var detailsCollection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewModel()
        configXib()
        tabBarController?.tabBar.isHidden = true
    }
    
    // MARK: - ViewModelConfiguration
    
    func configureViewModel() {
        
        viewModel.getPetInfoItems(petId: selectedId)
        viewModel.error = { errorMessage in
            print("Error: \(errorMessage)")
        }
        viewModel.success = {
            self.detailsCollection.reloadData()
            print(self.viewModel.petDetails)
            
        }
    }
    // MARK: - AdoptPetButton
    
    @IBAction func adoptionButtonTapped(_ sender: Any) {
        showAdoptionAlert()
        
    }
}
// MARK: - UIConfiguration

extension PetDetailsController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.petDetails.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = viewModel.petDetails[indexPath.item]
        
        switch item.type {
            
        case .image(let image):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PetImageCell", for: indexPath) as! PetImageCell
            cell.petImage.loadImage(url: image ?? "")
            return cell
        case .info(let info):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PetDetailsCell", for: indexPath) as! PetDetailsCell
            cell.configure(withInfo: info)
            //            cell.petEnergy
            //            cell.petSize.text = info.size
            return cell
        case .name(let name):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PetNameCell", for: indexPath) as! PetNameCell
            cell.petName.text = name
            return cell
        case .adress(let adress):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AdressCell", for: indexPath) as! AdressCell
            cell.shelterAdressLabel.text = adress
            return cell
        case .specification(let specification):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PetSpecificationCell", for: indexPath) as! PetSpecificationCell
            cell.houseTrainedLabel.text = specification?.trained
            cell.friendlyLabel.text = specification?.friendly
            return cell
        case .description(let description):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PetDetailsAboutCell", for: indexPath) as! PetDetailsAboutCell
            cell.petAbout.text = description
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let item = viewModel.petDetails[indexPath.item]
        
        switch item.type {
        case .image:
            return CGSize(width: collectionView.frame.width, height: 350)
        case .info:
            return CGSize(width: collectionView.frame.width - 30, height: 95)
        case .name:
            return CGSize(width: collectionView.frame.width - 40, height: 40)
        case .adress:
            return CGSize(width: collectionView.frame.width - 35, height: 24)
        case .specification:
            return CGSize(width: collectionView.frame.width - 30, height: 85)
        case .description:
            return CGSize(width: collectionView.frame.width - 45, height: 232)
        }
    }
}
// MARK: - CellRegistration

extension PetDetailsController {
    func configXib() {
        detailsCollection.register(UINib(nibName: "PetImageCell", bundle: nil), forCellWithReuseIdentifier: "PetImageCell")
        detailsCollection.register(UINib(nibName: "PetNameCell", bundle: nil), forCellWithReuseIdentifier: "PetNameCell")
        detailsCollection.register(UINib(nibName: "PetDetailsCell", bundle: nil), forCellWithReuseIdentifier: "PetDetailsCell")
        detailsCollection.register(UINib(nibName: "PetDetailsAboutCell", bundle: nil), forCellWithReuseIdentifier: "PetDetailsAboutCell")
        detailsCollection.register(UINib(nibName: "AdressCell", bundle: nil), forCellWithReuseIdentifier: "AdressCell")
        detailsCollection.register(UINib(nibName: "PetSpecificationCell", bundle: nil), forCellWithReuseIdentifier: "PetSpecificationCell")
        
    }
}
extension PetDetailsController {
    func showAdoptionAlert() {
            let alertController = UIAlertController(title: "Adopt a Pet", message: "Please enter your email. We will send you detailed information via email.", preferredStyle: .alert)

            alertController.addTextField { (textField) in
                textField.placeholder = "Your Email"
            }

            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alertController.addAction(cancelAction)

            let adoptAction = UIAlertAction(title: "Adopt", style: .default) { [weak self] (_) in
                guard let self = self, let userEmail = alertController.textFields?.first?.text else { return }

                
                if self.isValidEmail(email: userEmail) {
                   
                    self.saveAdoptionInfoToRealm(userEmail: userEmail)
                } else {
                   
                    self.showErrorMessage(message: "Invalid email format. Please enter a valid email.")
                }
            }

            alertController.addAction(adoptAction)

            present(alertController, animated: true, completion: nil)
        }

        func isValidEmail(email: String) -> Bool {
           
            let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
        }

        func saveAdoptionInfoToRealm(userEmail: String) {
            
            let adoptedPet = AdoptPets()
            adoptedPet.petName = "PetName"
            adoptedPet.userEmail = userEmail

            try? realm.write {
                realm.add(adoptedPet)
            }

            print("Adoption info saved to Realm: \(adoptedPet)")
        }

        func showErrorMessage(message: String) {
            let errorAlert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            errorAlert.addAction(okAction)
            present(errorAlert, animated: true, completion: nil)
        }
}
