//
//  NewsModel.swift
//  TakeMyPaws
//
//  Created by BUDLCIT on 2024. 02. 08..
//

import Foundation

// MARK: - NewsModel
struct NewsModel: Codable {
    let id: Int?
    let newsEn, image, descriptionEn, publisherName: String?
    let publisherImage: String?

    enum CodingKeys: String, CodingKey {
        case id
        case newsEn = "news_en"
        case image
        case descriptionEn = "description_en"
        case publisherName = "publisher_name"
        case publisherImage = "publisher_image"
    }
}
