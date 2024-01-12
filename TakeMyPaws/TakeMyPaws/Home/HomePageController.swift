//
//  HomePageController.swift
//  TakeMyPaws
//
//  Created by BUDLCIT on 2024. 01. 09..
//

import UIKit

class HomePageController: UIViewController {
    
    @IBOutlet weak var homeCollection: UICollectionView!
    var viewModel = HomePageViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
       
        configureViewModel()
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

}
