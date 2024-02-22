//
//  PetDetailsController.swift
//  TakeMyPaws
//
//  Created by BUDLCIT on 2024. 01. 29..
//

import UIKit
import RealmSwift

class PetDetailsController: UIViewController {
    
    var selectedId = 0
    var viewModel = PetDetailsViewModel()
    
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
            return CGSize(width: collectionView.frame.width - 45, height: 230)
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

// MARK: - PostPetDetails

extension PetDetailsController {
    
    func postAdoptionRequest(name: String, email: String, phoneNumber: String, comments: String?) {
        
        if let url = URL(string: "https://takemypaws.com/en/api/adopt") {
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let parameters: [String: Any] = ["petId": selectedId,
                                             "name": name,
                                             "email": email,
                                             "phoneNumber": phoneNumber,
                                             "comment": comments ?? ""]
            
            do {
                let jsonData = try JSONSerialization.data(withJSONObject: parameters)
                request.httpBody = jsonData
            } catch {
                print("Error converting parameters to JSON: \(error)")
                return
            }
            
            let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                
                if let error = error {
                    print("Error: \(error)")
                } else if let data = data {
                    print("Response data: \(String(data: data, encoding: .utf8) ?? "")")
                    
                }
            }
            
            task.resume()
        }
    }
}

// MARK: - AlertConfiguration

extension PetDetailsController {
    
    func isValidEmail(email: String) -> Bool {
        
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
    }
    
    func showErrorManager(message: String) {
        let errorAlert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        errorAlert.addAction(okAction)
        present(errorAlert, animated: true, completion: nil)
    }
    
    func showAdoptionAlert() {
        
        let alertController = UIAlertController(title: "Adopt a Pet", message: "Please provide the following information:", preferredStyle: .alert)
        
        alertController.addTextField { (textField) in
            textField.placeholder = "Your Name"
        }
        alertController.addTextField { (textField) in
            textField.placeholder = "Your Email"
            textField.keyboardType = .emailAddress
        }
        alertController.addTextField { (textField) in
            textField.placeholder = "Your Phone Number"
            textField.keyboardType = .phonePad
        }
        alertController.addTextField { (textField) in
            textField.placeholder = "Comments (Optional)"
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        let adoptAction = UIAlertAction(title: "Adopt", style: .default) { [weak self] (_) in
            guard let self = self,
                  let name = alertController.textFields?[0].text,
                  let email = alertController.textFields?[1].text,
                  let phoneNumber = alertController.textFields?[2].text else {
                return
            }
            
            if name.isEmpty || email.isEmpty || phoneNumber.isEmpty {
                self.showErrorManager(message: "Please fill in all required fields.")
                return
            }
            
            if !self.isValidEmail(email: email) {
                self.showErrorManager(message: "Invalid email format. Please enter a valid email.")
                return
            }
            
            self.postAdoptionRequest(name: name, email: email, phoneNumber: phoneNumber, comments: alertController.textFields?[3].text)
        }
        
        alertController.addAction(adoptAction)
        
        present(alertController, animated: true, completion: nil)
    }
}
