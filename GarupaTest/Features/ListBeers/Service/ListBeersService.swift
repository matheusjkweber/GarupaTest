//
//  ListBeersService.swift
//  GarupaTest
//
//  Created by Matheus Weber on 25/04/23.
//

import Foundation

class ListBeersService: ListBeersServicing {
    let manager: NetworkManager
    
    init(manager: NetworkManager) {
        self.manager = manager
    }
    
    func getBeers(page: Int,
                  limit: Int,
                  success: @escaping (_ beersModel: [BeerModel]) -> (),
                  failure: @escaping (_ error: NetworkResponse) -> ()) {
        
        manager.request(request: GarupaEndpoint.getBeers(page, limit), success: { (response: [BeerModel]) in
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
