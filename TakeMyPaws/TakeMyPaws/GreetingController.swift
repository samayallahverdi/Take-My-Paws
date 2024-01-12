//
//  GreetingController.swift
//  TakeMyPaws
//
//  Created by BUDLCIT on 2024. 01. 10..
//

import UIKit

class GreetingController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    @IBAction func getStartedButtonTapped(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "TabBarController") as! UITabBarController
        navigationController?.show(controller, sender: nil)
    }
}
