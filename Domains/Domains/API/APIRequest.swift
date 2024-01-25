//
//  CapStoreAPIRequest.swift
//  Domains
//
//  Created by George Dambara on 2024/01/26.
//

import Foundation
public protocol APIRequest{
    
    associatedtype Response : Decodable
    
    var baseURL:URL{get}
    var path:String{get}
    var method:HTTPMethod{get}
    var queryItems:[URLQueryItem]{get}
    var body: Encodable? {get}
    
}
