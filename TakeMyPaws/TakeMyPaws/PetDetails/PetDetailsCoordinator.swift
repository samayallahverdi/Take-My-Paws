//
//  PetDetailsCoordinator.swift
//  TakeMyPaws
//
//  Created by BUDLCIT on 2024. 02. 22..
//

import UIKit
import Foundation

class PetDetailsCoordinator: Coordinator {
    var selectedId: Int
    var navigationController: UINavigationController
    
    init(selectedId: Int, navigationController: UINavigationController) {
        self.selectedId = selectedId
        self.navigationController = navigationController
    }
    
    func start() {
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "\(PetDetailsController.self)") as! PetDetailsController
        controller.selectedId = selectedId
        navigationController.show(controller, sender: nil)
    }
}
