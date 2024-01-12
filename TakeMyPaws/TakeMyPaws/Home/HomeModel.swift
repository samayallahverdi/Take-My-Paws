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
        let nameAz, nameEn, nameRu: String?
        let petType, gender: Bool?
        let birthDate: String?
        let ageYear, ageMonth: Int?
        let size: [String]?
        let color: [String]?
        let energyLevel, playfullness, friendlinessToOthers, grooming: Int?
        let descriptionAz, descriptionEn, descriptionRu, imageOne: String?
        let imageTwo, imageThree: String?
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
            case shelterName = "shelter_name"
            case shelterRequisitiesAz = "shelter_requisities_az"
            case dateCreated = "date_created"
            case adopted
            case lostOrFound = "lost_or_found"
            case approved, breed
        }
    }
//
//    enum Color: String, Codable {
//        case black = "black"
//        case brown = "brown"
//        case grey = "grey"
//        case orange = "orange"
//        case peach = "peach"
//        case white = "white"
//    }
//
//    enum LostOrFound: String, Codable {
//        case adopt = "Adopt"
//    }
//
//    enum ShelterAddress: String, Codable {
//        case bakiŞəhəriQalaQəsəbəsiXaşaxunaBağları = "Baki şəhəri, Qala qəsəbəsi, Xaşaxuna Bağları"
//        case empty = ""
//        case hövsanQəsəbəsiBağEvləri = "Hövsan qəsəbəsi, bağ evləri"
//    }
//
//    enum ShelterAddressEn: String, Codable {
//        case bakuCityGalaSettlementKhashakhunaBaglari = "Baku city, Gala settlement, Khashakhuna Baglari"
//        case empty = ""
//        case hovsanSettlementDachas = "Hovsan settlement, dachas"
//        case hövsanQəsəbəsiBağEvləri = "Hövsan qəsəbəsi, bağ evləri"
//        case the1Q = "`1q"
//    }
//
//    enum ShelterAddressRu: String, Codable {
//        case empty = ""
//        case shelterAddressRuПосГовсаныДачныеМассивы = "Пос. Говсаны, Дачные Массивы"
//        case городБакуПоселокГалаХашахунаБахлары = "Город Баку, поселок Гала, Хашахуна Бахлары"
//        case посГовсаныДачныеМассивы = "пос. Говсаны, дачные массивы"
//        case посёлокГовсанДачныеМассивы = "Посёлок Говсан, дачные массивы"
//    }
//
//    enum ShelterName: String, Codable {
//        case bakuAnimalRescueSociety = "Baku Animal Rescue Society"
//        case dogHouse = "Dog House"
//        case friends = "Friends"
//        case shelterNameFRIENDS = "FRIENDS"
//    }
//
//    enum ShelterRequisitiesAz: String, Codable {
//        case empty = ""
//        case shelterRequisitiesAzFalse = "False"
//    }
//
//    enum Size: String, Codable {
//        case l = "l"
//        case m = "m"
//        case s = "s"
//        case xs = "xs"
//    }
