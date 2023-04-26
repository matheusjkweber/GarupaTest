//
//  BeerModel.swift
//  GarupaTest
//
//  Created by Matheus Weber on 23/04/23.
//

import UIKit

enum UnitType: String, Codable {
    case litres
    case kilograms
    case celsius
    case grams
}

struct BeerModel: Codable {
    var id: Int
    var name: String
    var tagline: String
    var firstBrewed: String
    var description: String
    var imageUrl: String
    var abv: Float?
    var ibu: Float?
    var targetFG: Float?
    var targetOG: Float?
    var ebc: Float?
    var srm: Float?
    var ph: Float?
    var attenuationLevel: Float?
    var volume: VolumeModel
    var boilVolume: VolumeModel
    var method: MethodModel
    var ingredients: IngredientsModel
    var foodPairing: [String]
    var brewersTips: String
    var contributedBy: String
    
    var downloadedImage: UIImage? = nil
    
    init(id: Int, name: String, tagline: String, firstBrewed: String, description: String, imageUrl: String, abv: Float?, ibu: Float?, targetFG: Float?, targetOG: Float?, ebc: Float?, srm: Float?, ph: Float?, attenuationLevel: Float?, volume: VolumeModel, boilVolume: VolumeModel, method: MethodModel, ingredients: IngredientsModel, foodPairing: [String], brewerTips: String, contributedBy: String) {
        self.id = id
        self.name = name
        self.tagline = tagline
        self.firstBrewed = firstBrewed
        self.description = description
        self.imageUrl = imageUrl
        self.abv = abv
        self.ibu = ibu
        self.targetFG = targetFG
        self.targetOG = targetOG
        self.ebc = ebc
        self.srm = srm
        self.ph = ph
        self.attenuationLevel = attenuationLevel
        self.volume = volume
        self.boilVolume = boilVolume
        self.method = method
        self.ingredients = ingredients
        self.foodPairing = foodPairing
        self.brewersTips = brewerTips
        self.contributedBy = contributedBy
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case tagline
        case firstBrewed = "first_brewed"
        case description
        case imageUrl = "image_url"
        case abv
        case ibu
        case targetFG = "target_fg"
        case targetOG = "target_og"
        case ebc
        case srm
        case ph
        case attenuationLevel = "attenuation_level"
        case volume
        case boilVolume = "boil_volume"
        case method
        case ingredients
        case foodPairing = "food_pairing"
        case brewersTips = "brewers_tips"
        case contributedBy = "contributed_by"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.tagline = try container.decode(String.self, forKey: .tagline)
        self.firstBrewed = try container.decode(String.self, forKey: .firstBrewed)
        self.description = try container.decode(String.self, forKey: .description)
        self.imageUrl = try container.decode(String.self, forKey: .imageUrl)
        self.abv = try container.decode(Float?.self, forKey: .abv)
        self.ibu = try container.decode(Float?.self, forKey: .ibu)
        self.targetFG = try container.decode(Float?.self, forKey: .targetFG)
        self.targetOG = try container.decode(Float?.self, forKey: .targetOG)
        self.ebc = try container.decode(Float?.self, forKey: .ebc)
        self.srm = try container.decode(Float?.self, forKey: .srm)
        self.ph = try container.decode(Float?.self, forKey: .ph)
        self.attenuationLevel = try container.decode(Float?.self, forKey: .attenuationLevel)
        self.volume = try container.decode(VolumeModel.self, forKey: .volume)
        self.boilVolume = try container.decode(VolumeModel.self, forKey: .boilVolume)
        self.method = try container.decode(MethodModel.self, forKey: .method)
        self.ingredients = try container.decode(IngredientsModel.self, forKey: .ingredients)
        self.foodPairing = try container.decode([String].self, forKey: .foodPairing)
        self.brewersTips = try container.decode(String.self, forKey: .brewersTips)
        self.contributedBy = try container.decode(String.self, forKey: .contributedBy)
    }
}


