//
//  HomePageViewModel.swift
//  TakeMyPaws
//
//  Created by BUDLCIT on 2024. 01. 09..
//

import Foundation

class HomePageViewModel {
    
    var home = [HomeModel]()
    var favorites = [FavoritesPetModel]()
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    
    
    private let manager = HomePageManager()
    
    func getHomeDetails(){
        manager.getData(endpoint: .main) { data, errorMessage in
            if let errorMessage {
                self.error?(errorMessage)
                print("error viewModel")
            } else if let data {
                print(data)
                self.home.append(contentsOf: data)
                self.success?()
//                print(self.home)
            }
            
        }
    }
    
//    func getFavoritesDetails(){
//        manager.getData(endpoint: .favorites) { data, errorMessage in
//            if let errorMessage {
//                self.error?(errorMessage)
//                print("error viewModel")
//            } else if let data {
//                self.favorites.append(contentsOf: data)
//                self.success?()
////                print(self.favorites)
//            }
//        }
//    }
//    func isFavorite(petId: Int) -> Bool {
//            return favorites.contains { $0.idNumber == petId }
//        }
}
