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
}


