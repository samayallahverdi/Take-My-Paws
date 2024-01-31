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
    case name(String?)
    case info(PetInfo)
    case description(String?)
    
}

struct PetInfo {
    let gender: Bool?
    let energy: Int?
    let size: [String]?
}

class PetDetailsViewModel {
    
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
                    let nameType = PetDetailType.name(petDetail.nameEn)
                    let infoType = PetDetailType.info(PetInfo(gender: petDetail.gender, energy: petDetail.energyLevel, size: petDetail.size))
                    let descriptionType = PetDetailType.description(petDetail.descriptionEn) 
                    
                    self.petDetails.append(PetDetailModel(type: imageType))
                    self.petDetails.append(PetDetailModel(type: nameType))
                    self.petDetails.append(PetDetailModel(type: infoType))
                    self.petDetails.append(PetDetailModel(type: descriptionType))
                }
                
                self.success?()
                
            }
        }
    }
}
