//
//  SearchViewModel.swift
//  TakeMyPaws
//
//  Created by BUDLCIT on 2024. 02. 20..
//

import Foundation

class SearchViewModel {
    var searchPets = [HomeModel]()
   
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    
    private let manager = SearchManager()
    
    func search(key: String) {
        manager.search(endpoint: .search, key: key) { data, errorMessage in
            if let errorMessage {
                self.error?(errorMessage)
            } else if let data {
                self.searchPets = data
                
                self.success?()
            }
        }
    }
}
