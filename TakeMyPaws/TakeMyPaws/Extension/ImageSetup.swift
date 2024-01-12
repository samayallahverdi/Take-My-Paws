//
//  ImageSetup.swift
//  TakeMyPaws
//
//  Created by BUDLCIT on 2024. 01. 09..
//

import Foundation
import UIKit
import Kingfisher

extension UIImageView {
    func loadImage(url: String) {
        let path = "\(NetworkHelper.imagePath)\(url)"
        if let finalUrl = URL(string: path) {
            self.kf.setImage(with: finalUrl)
        }
    }
}
