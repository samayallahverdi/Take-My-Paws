//
//  HomePageManager.swift
//  TakeMyPaws
//
//  Created by BUDLCIT on 2024. 01. 09..
//

import Foundation

class HomePageManager: HomeUseCase {
    func getData(endpoint: HomeEndpoint, completion: @escaping (([HomeModel]?, String?) -> Void)) {
        NetworkManager.request(model: [HomeModel].self, endpoint: endpoint.rawValue, completion: completion)
    }
}

