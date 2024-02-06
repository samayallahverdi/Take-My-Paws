//
//  FavoriteViewModel.swift
//  TakeMyPaws
//
//  Created by BUDLCIT on 2024. 02. 04..
//

import Foundation

class FavoritesViewModel {
    
    var favorites = [FavoritesPetModel]()
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    
    
    private let manager = FavoritePageManager()
    
    func getFavoritesDetails(){
        manager.getData(endpoint: .favorites) { data, errorMessage in
            if let errorMessage {
                self.error?(errorMessage)
                print("error viewModel")
            } else if let data {
//                self.favorites.append(contentsOf: data)
                self.favorites = data
                self.success?()
//                print(self.favorites)
            }
        }
    }
}
