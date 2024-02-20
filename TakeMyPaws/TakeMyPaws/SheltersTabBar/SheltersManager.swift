//
//  SheltersManager.swift
//  TakeMyPaws
//
//  Created by BUDLCIT on 2024. 02. 14..
//

import Foundation

class SheltersManagerManager {
    func getData(endpoint: SheltersEndpoint, completion: @escaping (([ShelterModel]?, String?) -> Void)) {
        NetworkManager.request(model: [ShelterModel].self, endpoint: endpoint.rawValue, completion: completion)
    }
}
