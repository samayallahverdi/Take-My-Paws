//
//  HomeModel.swift
//  TakeMyPaws
//
//  Created by BUDLCIT on 2024. 01. 09..
//

import Foundation

// MARK: - HomeModel
struct HomeModel: Codable {
    let idNumber: Int?
    let shelterAddress: String?
        let infoLostandfound: String?
        let shelterAddressEn: String?
        let shelterAddressRu: String?
        let ageDay: Int?
        let isFavorite: Bool?
        let nameAz, nameEn, nameRu: String?
        let petType, gender: Bool?
        let birthDate: String?
        let ageYear, ageMonth: Int?
        let size: [String]?
        let color: [String]?
        let energyLevel, playfullness, friendlinessToOthers, grooming: Int?
        let descriptionAz, descriptionEn, descriptionRu, imageOne: String?
        let imageTwo, imageThree: String?
        let houseTrained: String?
        let petFriendly: String?
        let shelterName: String?
        let shelterRequisitiesAz: String?
        let dateCreated: String?
        let adopted: Bool?
        let lostOrFound: String?
        let approved: Bool?
        let breed: Int?

        enum CodingKeys: String, CodingKey {
            case idNumber = "id_number"
            case shelterAddress = "shelter_address"
            case infoLostandfound = "info_lostandfound"
            case shelterAddressEn = "shelter_address_en"
            case shelterAddressRu = "shelter_address_ru"
            case ageDay = "age_day"
            case isFavorite = "is_favorite"
            case nameAz = "name_az"
            case nameEn = "name_en"
            case nameRu = "name_ru"
            case petType = "pet_type"
            case gender
            case birthDate = "birth_date"
            case ageYear = "age_year"
            case ageMonth = "age_month"
            case size, color
            case energyLevel = "energy_level"
            case playfullness
            case friendlinessToOthers = "friendliness_to_others"
            case grooming
            case descriptionAz = "description_az"
            case descriptionEn = "description_en"
            case descriptionRu = "description_ru"
            case imageOne = "image_one"
            case imageTwo = "image_two"
            case imageThree = "image_three"
            case houseTrained = "house_trained"
            case petFriendly = "pet_friendly"
            case shelterName = "shelter_name"
            case shelterRequisitiesAz = "shelter_requisities_az"
            case dateCreated = "date_created"
            case adopted
            case lostOrFound = "lost_or_found"
            case approved, breed
        }
    }
