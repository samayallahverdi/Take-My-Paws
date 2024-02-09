//
//  PostModel.swift
//  TakeMyPaws
//
//  Created by BUDLCIT on 2024. 02. 06..
//

import Foundation

    

class PostModel {
    
    func postFavorite(petId: Int, fullName: String) {
        let url = URL(string: "https://takemypaws.com/en/api/favorites")!
        
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        let parameters: [String: Any] = [
            "pet_id": petId,
            "username": "samaya"
        ]
        
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: parameters)
            request.httpBody = jsonData
        } catch {
            print("Error converting parameters to JSON: \(error)")
            return
        }
        
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error: \(error)")
            } else if let data = data {
                print("Response data: \(String(data: data, encoding: .utf8) ?? "")")
                
            }
        }
        
        task.resume()
        
    }
    
    func deleteFavorite(petId: Int, fullName: String) {
        
        let url = URL(string: "https://takemypaws.com/en/api/favorites")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        let parameters: [String: Any] = [
            "pet_id": petId,
            "username": "samaya"
        ]
        
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: parameters)
            request.httpBody = jsonData
        } catch {
            print("Error converting parameters to JSON: \(error)")
            return
        }
        
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error: \(error)")
            } else if let data = data {
                print("Response data: \(String(data: data, encoding: .utf8) ?? "")")
               

                
            }
        }
        
        task.resume()
        
        
    }
}
