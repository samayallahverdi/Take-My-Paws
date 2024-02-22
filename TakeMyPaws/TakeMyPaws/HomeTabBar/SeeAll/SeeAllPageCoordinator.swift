//
//  SeeAllPageCoordinator.swift
//  TakeMyPaws
//
//  Created by BUDLCIT on 2024. 02. 22..
//

import UIKit
import Foundation

class SeeAllPageCoordinator: Coordinator {
   
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "\(SeeAllController.self)") as! SeeAllController      
        navigationController.show(controller, sender: nil)
    }
}
