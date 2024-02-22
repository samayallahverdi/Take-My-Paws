//
//  Coordinator.swift
//  TakeMyPaws
//
//  Created by BUDLCIT on 2024. 02. 22..
//

import Foundation
import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    
    func start()
}
