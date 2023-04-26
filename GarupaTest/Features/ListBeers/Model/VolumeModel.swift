//
//  VolumeModel.swift
//  GarupaTest
//
//  Created by Matheus Weber on 23/04/23.
//

struct VolumeModel: Codable {
    var value: Int
    var unit: UnitType
    
    init(value: Int, unit: UnitType) {
        self.value = value
        self.unit = unit
    }
    
    enum CodingKeys: String, CodingKey {
        case value
        case unit
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.value = try container.decode(Int.self, forKey: .value)
        self.unit = try container.decode(UnitType.self, forKey: .unit)
    }
}
