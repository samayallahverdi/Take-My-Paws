//
//  HomeUseCase.swift
//  TakeMyPaws
//
//  Created by BUDLCIT on 2024. 01. 29..
//

import Foundation

protocol HomeUseCase {
    func getData(endpoint: HomeEndpoint, completion: @escaping (([HomeModel]?, String?) -> Void))
}
