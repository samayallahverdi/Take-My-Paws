//
//  SheltersModel.swift
//  TakeMyPaws
//
//  Created by BUDLCIT on 2024. 02. 14..
//

import Foundation

// MARK: - ShelterModel
struct ShelterModel: Codable {
    let id: Int?
    let name, description, image, address: String?
    let contact: String?
}
