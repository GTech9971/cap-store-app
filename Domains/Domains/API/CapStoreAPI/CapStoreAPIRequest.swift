//
//  CapStoreAPIRequest.swift
//  Domains
//
//  Created by George Dambara on 2024/01/26.
//

import Foundation

public extension APIRequest{
    
    var baseURL : URL{
        return URL(string: "http://localhost:5156/api/v1/")!
    }
    
    func buildURLRequest() -> URLRequest{
        let url = baseURL.appendingPathComponent(path)
        var components = URLComponents(
            url: url, resolvingAgainstBaseURL: true
        )
        
        switch method {
        case .get:
            components?.queryItems = queryItems
        default:
            fatalError()
        }
        
        var urlRequest = URLRequest(url:url)
        urlRequest.url = components?.url
        urlRequest.httpMethod  = method.rawValue
        
        return urlRequest
    }
    
    
}
