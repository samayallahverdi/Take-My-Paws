//
//  AlertFunction.swift
//  TakeMyPaws
//
//  Created by BUDLCIT on 2024. 02. 22..
//

import UIKit

class AlertFunction: NSObject {
    static func showAlert(view: UIViewController, title: String, message: String) {
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        let okayButton = UIAlertAction(title: "Okay", style: .default)
        alertController.addAction(okayButton)
        view.present(alertController, animated: true)
    }
}
