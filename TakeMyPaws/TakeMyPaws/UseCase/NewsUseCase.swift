//
//  NewsUseCase.swift
//  TakeMyPaws
//
//  Created by BUDLCIT on 2024. 02. 08..
//

import Foundation

protocol NewsUseCase {
    func getData(endpoint: NewsEndpoint, completion: @escaping (([NewsModel]?, String?) -> Void))
}
