//
//  SheltersViewModel.swift
//  TakeMyPaws
//
//  Created by BUDLCIT on 2024. 02. 14..
//

import Foundation

import Foundation

class SheltersViewModel {
    
    var shelters = [ShelterModel]()
    
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    
    private let manager = SheltersManagerManager()
    
    func getShelterDetails(){
        manager.getData(endpoint: .shelters) { data, errorMessage in
            if let errorMessage {
                self.error?(errorMessage)
                print("error viewModel")
            } else if let data {
                self.shelters.append(contentsOf: data)
                self.success?()
               
            }
            
        }
    }
}
