//
//  DataBase.swift
//  TakeMyPaws
//
//  Created by BUDLCIT on 2024. 01. 30..
//

import Foundation
import RealmSwift
import UIKit

class DataBase {
    let realm = try! Realm()
    func getFilePath() {
        if let url = realm.configuration.fileURL {
            print(url)
        }
    }
    
}
