//
//  NewsManager.swift
//  TakeMyPaws
//
//  Created by BUDLCIT on 2024. 02. 08..
//

import Foundation

class NewsPageManager: NewsUseCase{
    func getData(endpoint: NewsEndpoint, completion: @escaping (([NewsModel]?, String?) -> Void)) {
        NetworkManager.request(model: [NewsModel].self, endpoint: endpoint.rawValue, completion: completion)
    }
}
