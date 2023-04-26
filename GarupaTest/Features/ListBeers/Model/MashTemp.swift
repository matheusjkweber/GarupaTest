//
//  MashTemp.swift
//  GarupaTest
//
//  Created by Matheus Weber on 23/04/23.
//

struct MashTemp: Codable {
    var temp: TempModel
    var duration: Int?
    
    init(temp: TempModel, duration: Int?) {
        self.temp = temp
        self.duration = duration
    }
}
