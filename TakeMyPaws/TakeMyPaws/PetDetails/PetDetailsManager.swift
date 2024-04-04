//
//  PetDetailsManager.swift
//  TakeMyPaws
//
//  Created by BUDLCIT on 2024. 01. 29..
//

import Foundation
class PetDetailsManager {
    func getData(idNumber: Int?, endpoint: PetDetailsEndpoint, completion: @escaping (([PetDetailsModel]?, String?) -> Void)) {
        NetworkManager.request(model: [PetDetailsModel].self, endpoint: "\(endpoint.rawValue)\(idNumber ?? 0)", completion: completion)
    }
}
