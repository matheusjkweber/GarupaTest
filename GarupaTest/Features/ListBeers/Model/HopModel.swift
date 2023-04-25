//
//  HopModel.swift
//  GarupaTest
//
//  Created by Matheus Weber on 23/04/23.
//

class HopModel {
    var name: String
    var amount: AmountModel
    var add: String
    var attribute: String
    
    init(name: String, amount: AmountModel, add: String, attribute: String) {
        self.name = name
        self.amount = amount
        self.add = add
        self.attribute = attribute
    }
}
