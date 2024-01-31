//
//  Model.swift
//  TakeMyPaws
//
//  Created by BUDLCIT on 2024. 01. 30..
//

import Foundation
import RealmSwift

class FavoritePets: Object {
    @Persisted var petName: String
    @Persisted var userEmail: String
    @Persisted var userPhone: String
}
