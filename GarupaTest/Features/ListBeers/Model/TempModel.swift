//
//  TempModel.swift
//  GarupaTest
//
//  Created by Matheus Weber on 23/04/23.
//

struct TempModel: Codable {
    var value: Int
    var unit: UnitType
    
    init(value: Int, unit: UnitType) {
        self.value = value
        self.unit = unit
    }
}
