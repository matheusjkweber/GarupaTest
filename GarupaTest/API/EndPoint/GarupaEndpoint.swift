//
//  GarupaEndpoint.swift
//  NetworkLayer
//
//  Created by Matheus Weber on 25/04/22.
//  Copyright © 2018 Matheus Weber. All rights reserved.
//  This Network Layer was created from Malcolm Kumwenda`s Medium Tutorial
//

import Foundation

public enum GarupaEndpoint {
    case getBeers(Int, Int)
    case getImage(URL)
}

extension GarupaEndpoint: EndPointType {
    var environmentBaseURL : String {
        return "https://api.punkapi.com/v2/"
    }
    
    var specificURL: URL? {
        switch self {
        case .getImage(let url):
            return url
        default:
            return nil
        }
    }
    
    var baseURL: URL {
        guard let url = URL(string: environmentBaseURL) else {
            fatalError("baseURL could not be configured.")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .getBeers:
            return "beers"
        default:
            return ""
        }
    }
    
    var queryParams: [URLQueryItem] {
        switch self {
        case .getBeers(let page, let limit):
            return [URLQueryItem(name: "page", value: "\(page)"), URLQueryItem(name: "per_page", value: "\(limit)")]
        default:
            return []
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        default:
            return .get
        }
    }
    
    var task: HTTPTask {
        switch self {
        default:
            return .request
        }
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
    
    var completeURL: URL {
        guard let url = URL(string: "\(environmentBaseURL)\(path)") else {
            fatalError("baseURL could not be configured.")
        }
        return url
    }
}


