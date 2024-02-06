//
//  SeeAllPageViewModel.swift
//  TakeMyPaws
//
//  Created by BUDLCIT on 2024. 01. 29..
//

import Foundation
class SeeAllPageViewModel {
    
    var pets = [HomeModel]()
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    
    
    private let manager = HomePageManager()
    
    func getPetDetails(){
        manager.getData(endpoint: .main) { data, errorMessage in
            if let errorMessage {
                self.error?(errorMessage)
                print("error viewModel")
            } else if let data {
                self.pets.append(contentsOf: data)
                self.success?()
            }
            
        }
    }
}
