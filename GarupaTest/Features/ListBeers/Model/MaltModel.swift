//
//  MaltModel.swift
//  GarupaTest
//
//  Created by Matheus Weber on 23/04/23.
//

struct MaltModel: Codable {
    var name: String
    var amount: AmountModel
    
    init(name: String, amount: AmountModel) {
        self.name = name
        self.amount = amount
    }
}
