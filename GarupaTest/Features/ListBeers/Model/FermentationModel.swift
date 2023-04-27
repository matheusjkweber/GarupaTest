//
//  FermentationModel.swift
//  GarupaTest
//
//  Created by Matheus Weber on 23/04/23.
//

struct FermentationModel: Codable {
    var temp: TempModel?
    
    init(temp: TempModel?) {
        self.temp = temp
    }
}
