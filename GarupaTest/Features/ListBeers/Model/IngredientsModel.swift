//
//  IngredientsModel.swift
//  GarupaTest
//
//  Created by Matheus Weber on 23/04/23.
//

class IngredientsModel {
    var malt: [MaltModel]
    var hops: [HopModel]
    var yeast: String
    
    init(malt: [MaltModel], hops: [HopModel], yeast: String) {
        self.malt = malt
        self.hops = hops
        self.yeast = yeast
    }
}
