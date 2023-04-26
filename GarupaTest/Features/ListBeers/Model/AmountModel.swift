//
//  AmountModel.swift
//  GarupaTest
//
//  Created by Matheus Weber on 23/04/23.
//

struct AmountModel: Codable {
    var value: Float
    var unit: UnitType
    
    init(value: Float, unit: UnitType) {
        self.value = value
        self.unit = unit
    }
}
