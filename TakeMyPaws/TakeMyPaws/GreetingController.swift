//
//  GreetingController.swift
//  TakeMyPaws
//
//  Created by BUDLCIT on 2024. 02. 20..
//

import UIKit

class GreetingController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

      
    }

    @IBAction func starrButtonTapped(_ sender: Any) {
//        UserDefaults.standard.set(true, forKey: "hasPresentedGreetingController")
        let controller = storyboard?.instantiateViewController(withIdentifier: "TabBarController") as! UITabBarController
        navigationController?.show(controller, sender: nil)
    }
    

}
