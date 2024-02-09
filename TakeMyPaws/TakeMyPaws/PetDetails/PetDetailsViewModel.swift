//
//  PetDetailsViewModel.swift
//  TakeMyPaws
//
//  Created by BUDLCIT on 2024. 01. 29..
//

import Foundation


struct PetDetailModel {
    let type: PetDetailType
}

enum PetDetailType {
    case image(String?)
    case info(PetInfo)
    case name(String?)
    case adress(String?)
    case specification(PetSpecification?)
    case description(String?)
}

struct PetInfo {
    let gender: Bool?
    let energy: Int?
    let size: [String]?
}
struct PetSpecification {
    let trained: String?
    let friendly: String?
}

class PetDetailsViewModel {
    
    var petName: String?
    var petDetails = [PetDetailModel]()
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    
    private let manager = PetDetailsManager()
    
    func getPetInfoItems(petId: Int?) {
        manager.getData(idNumber: petId, endpoint: .details) { data, errorMessage in
            if let errorMessage {
                self.error?(errorMessage)
            } else if let data {
                self.petDetails.removeAll()
                
                for petDetail in data {
                    let imageType = PetDetailType.image(petDetail.imageOne)
                    let infoType = PetDetailType.info(PetInfo(gender: petDetail.gender, energy: petDetail.energyLevel, size: petDetail.size))
                    let nameType = PetDetailType.name(petDetail.nameEn)
                    let adressType = PetDetailType.adress(petDetail.shelterAddressEn)
                    let specifictionType = PetDetailType.specification(PetSpecification(trained: petDetail.houseTrained, friendly: petDetail.petFriendly))
                    let descriptionType = PetDetailType.description(petDetail.descriptionEn)
                    
                    self.petDetails.append(PetDetailModel(type: imageType))
                    self.petDetails.append(PetDetailModel(type: infoType))
                    self.petDetails.append(PetDetailModel(type: nameType))
                    self.petDetails.append(PetDetailModel(type: adressType))
                    self.petDetails.append(PetDetailModel(type: specifictionType))
                    self.petDetails.append(PetDetailModel(type: descriptionType))
                }
                
                self.success?()
            }
        }
    }
}
