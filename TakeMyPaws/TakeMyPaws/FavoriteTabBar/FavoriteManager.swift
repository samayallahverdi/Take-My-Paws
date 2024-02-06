//
//  FavoriteManager.swift
//  TakeMyPaws
//
//  Created by BUDLCIT on 2024. 02. 04..
//

import Foundation

class FavoritePageManager {
    func getData(endpoint: FavoritesEndpoint, completion: @escaping (([FavoritesPetModel]?, String?) -> Void)) {
        NetworkManager.request(model: [FavoritesPetModel].self, endpoint: endpoint.rawValue, completion: completion)
    }
}
