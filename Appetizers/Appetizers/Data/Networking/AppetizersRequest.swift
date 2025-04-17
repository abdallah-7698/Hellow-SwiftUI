//
//  AppetizersRequest.swift
//  Netwoking
//
//  Created by Abdallah on 07/04/2025.
//

import Netwoking
import Foundation

struct AppetizersRequest: RequestType {
 
    public var baseUrl: URL { Constants.AppetizersDB }
    public var path: String { "appetizers" }
    public var method: String = "GET"
    
    var validStatusCode: [Int] = [200]
    
    public let responseDecoder: (Data) throws -> AppetizerResponse = { data in
        try JSONDecoder().decode(ResponseType.self, from: data)
    }
    
}

struct ImageRequest<T>: RequestType {
 
    public var baseUrl: URL
    public var path: String = String()
    public var method: String = "GET"
    
    var validStatusCode: [Int] = [200]
    
    public let responseDecoder: (Data) throws -> T
}
