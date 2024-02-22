//
//  SeeAllPageManager.swift
//  TakeMyPaws
//
//  Created by BUDLCIT on 2024. 01. 29..
//

import Foundation
class SeeAllPageManager: HomeUseCase {
    func getData(endpoint: HomeEndpoint, completion: @escaping (([HomeModel]?, String?) -> Void)) {
        NetworkManager.request(model: [HomeModel].self, endpoint: endpoint.rawValue, completion: completion)
    }
}
