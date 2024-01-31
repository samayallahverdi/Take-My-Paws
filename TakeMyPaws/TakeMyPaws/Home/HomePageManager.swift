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
//    func search(endpoint: HomeEndpoint,key: String, completion: @escaping (([HomeModel]?, String?) -> Void)) {
//
//        let params : [String: Any] = ["query": key]
//
//        NetworkManager.request(model: [HomeModel].self,
//                               endpoint: endpoint.rawValue,
//                               parameters: params
//        ) { data, errorMessage in
//            if let errorMessage {
//               completion(nil, errorMessage)
//            } else if let data {
//                completion(data, nil)
//            }
//        }
//
//    }
}
