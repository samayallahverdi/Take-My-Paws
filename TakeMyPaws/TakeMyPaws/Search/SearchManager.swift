//
//  SearchManager.swift
//  TakeMyPaws
//
//  Created by BUDLCIT on 2024. 02. 20..
//

import Foundation

class SearchManager {
    func search(endpoint: SearchEndpoint, key: String, completion: @escaping (([HomeModel]?, String?) -> Void)) {
        
        let params : [String: Any] = ["query": key]
        
        NetworkManager.request(model: [HomeModel].self,
                               endpoint: endpoint.rawValue,
                               parameters: params
        ) { data, errorMessage in
            if let errorMessage {
                completion(nil, errorMessage)
            } else if let data {
                completion(data, nil)
            }
        }
    }
}
