//
//  NewsDetailsCoordinator.swift
//  TakeMyPaws
//
//  Created by BUDLCIT on 2024. 02. 22..
//
import UIKit
import Foundation


import UIKit
import Foundation

class NewsDetailsCoordinator: Coordinator {
    var selectedId: NewsModel
    var navigationController: UINavigationController
    
    init(selectedId: NewsModel, navigationController: UINavigationController) {
        self.selectedId = selectedId
        self.navigationController = navigationController
    }
    
    func start() {
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "\(NewsDetailsController.self)") as! NewsDetailsController
        controller.selectedNews = selectedId
        navigationController.show(controller, sender: nil)
    }
}
