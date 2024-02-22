//
//  NewsViewModel.swift
//  TakeMyPaws
//
//  Created by BUDLCIT on 2024. 02. 08..
//

import Foundation

class NewsViewModel {
    
    var mainNews = [NewsModel]()
    var latestNews = [NewsModel]()
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    
    private let manager = NewsPageManager()
    
    func getLatestNewsDetails(){
        manager.getData(endpoint: .lt) { data, errorMessage in
            if let errorMessage {
                self.error?(errorMessage)
                print("error viewModel")
            } else if let data {
                self.latestNews.append(contentsOf: data)
                self.success?()
            }
        }
    }
    
    func getMainNewsDetails(){
        manager.getData(endpoint: .main) { data, errorMessage in
            if let errorMessage {
                self.error?(errorMessage)
                print("error viewModel")
            } else if let data {
                self.mainNews.append(contentsOf: data)
                self.success?()
            }
        }
    }
}
