//
//  NetworkManager.swift
//  TakeMyPaws
//
//  Created by BUDLCIT on 2024. 01. 09..
//

import Foundation
import Alamofire

class NetworkManager {
    static func request<T: Codable>(model: T.Type,
                                    endpoint: String,
                                    method: HTTPMethod = .get,
                                    parameters: Parameters? = nil,
                                    encoding: ParameterEncoding = URLEncoding.default,
                                    completion: @escaping((T?, String?) -> Void)) {
        
        AF.request("\(NetworkHelper.baseURL)\(endpoint)",
                   method: method,
                   parameters: parameters,
                   encoding: encoding,
                   headers: NetworkHelper.headers).responseDecodable(of: T.self) { response in
            switch response.result {
            case .success(let data):
                completion(data, nil)
            case .failure(let error):
                completion(nil, error.localizedDescription)
            }
        }
    }
    
    static func postRequest<T: Codable>(model: T.Type,
                                            endpoint: String,
                                            parameters: Parameters? = nil,
                                            encoding: ParameterEncoding = URLEncoding.default,
                                            completion: @escaping((T?, String?) -> Void)) {
            
            AF.request("\(NetworkHelper.baseURL)\(endpoint)",
                       method: .post,
                       parameters: parameters,
                       encoding: encoding,
                       headers: NetworkHelper.headers).responseDecodable(of: T.self) { response in
                switch response.result {
                case .success(let data):
                    completion(data, nil)
                case .failure(let error):
                    completion(nil, error.localizedDescription)
                }
            }
        }
    
    
    static func deleteRequest<T: Codable>(model: T.Type,
                                              endpoint: String,
                                              parameters: Parameters? = nil,
                                              encoding: ParameterEncoding = URLEncoding.default,
                                              completion: @escaping((T?, String?) -> Void)) {
            
            AF.request("\(NetworkHelper.baseURL)\(endpoint)",
                       method: .delete,
                       parameters: parameters,
                       encoding: encoding,
                       headers: NetworkHelper.headers).responseDecodable(of: T.self) { response in
                switch response.result {
                case .success(let data):
                    completion(data, nil)
                case .failure(let error):
                    completion(nil, error.localizedDescription)
                }
            }
        }

}
