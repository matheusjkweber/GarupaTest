//
//  BeerModel.swift
//  GarupaTest
//
//  Created by Matheus Weber on 23/04/23.
//

class BeerModel {
    var id: Int
    var name: String
    var tagline: String
    var firstBrewed: String
    var description: String
    var imageUrl: String
    var abv: Float
    var ibu: Int
    var targetFG: Int
    var targetOG: Int
    var ebc: Int
    var srm: Int
    var ph: Float
    var attenuationLevel: Int
    var volume: VolumeModel
    var boilVolume: VolumeModel
    var method: MethodModel
    var ingredients: IngredientsModel
    var foodPairing: [String]
    var brewersTips: String
    var contributedBy: String
    
    init(id: Int, name: String, tagline: String, firstBrewed: String, description: String, imageUrl: String, abv: Float, ibu: Int, targetFG: Int, targetOG: Int, ebc: Int, srm: Int, ph: Float, attenuationLevel: Int, volume: VolumeModel, boilVolume: VolumeModel, method: MethodModel, ingredients: IngredientsModel, foodPairing: [String], brewerTips: String, contributedBy: String) {
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
}


