//
//  ListBeersService.swift
//  GarupaTest
//
//  Created by Matheus Weber on 25/04/23.
//

import Foundation

class ListBeersService {
    let manager: NetworkManager
    
    init(manager: NetworkManager) {
        self.manager = manager
    }
    
    func getBeers(success: @escaping (_ beersModel: [BeerModel]) -> (),
                  failure: @escaping (_ error: NetworkResponse) -> ()) {
        
        manager.request(request: GarupaEndpoint.getBeers, success: { (response: [BeerModel]) in
            success(response)
        }) { (error) in
            failure(error)
        }
    }

    func getImage(imageURL: URL,
                  success: @escaping (_ imageData: Data) -> (),
                  failure: @escaping (_ error: NetworkResponse) -> ()) {
        manager.requestData(request: GarupaEndpoint.getImage(imageURL), success: { (response: Data) in
            success(response)
        }) { (error) in
            failure(error)
        }
    }
}
