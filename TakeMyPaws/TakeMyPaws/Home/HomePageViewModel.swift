//
//  HomePageViewModel.swift
//  TakeMyPaws
//
//  Created by BUDLCIT on 2024. 01. 09..
//

import Foundation

class HomePageViewModel {
    
    var home = [HomeModel]()
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    
    
    private let manager = HomePageManager()
    
    func getHomeDetails(){
        manager.getHomeData(endpoint: .main) { data, errorMessage in
            if let errorMessage {
                self.error?(errorMessage)
                print("error viewModel")
            } else if let data {
                self.home.append(contentsOf: data)
                self.success?()
                print(self.home)
            }
            
        }
    }
}
