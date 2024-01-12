//
//  HomePageManager.swift
//  TakeMyPaws
//
//  Created by BUDLCIT on 2024. 01. 09..
//

import Foundation

class HomePageManager {
    func getHomeData(endpoint: HomeEndpoint, completion: @escaping (([HomeModel]?, String?) -> Void)) {
        NetworkManager.request(model: [HomeModel].self, endpoint: endpoint.rawValue, completion: completion)
    }
}
