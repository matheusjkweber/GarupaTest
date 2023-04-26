//
//  MethodModel.swift
//  GarupaTest
//
//  Created by Matheus Weber on 23/04/23.
//

struct MethodModel: Codable {
    var mashTemp: [MashTemp]
    var fermentation: FermentationModel
    var twist: String?
    
    init(mashTemp: [MashTemp], fermentation: FermentationModel, twist: String?) {
        self.mashTemp = mashTemp
        self.fermentation = fermentation
        self.twist = twist
    }
    
    enum CodingKeys: String, CodingKey {
        case mashTemp = "mash_temp"
        case fermentation
        case twist
    }
}
