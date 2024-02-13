//
//  CapStoreAPIRequest.swift
//  Domains
//
//  Created by George Dambara on 2024/01/26.
//

import Foundation

public extension APIRequest{
    
    var baseURL : URL{
        //return URL(string: "http://localhost:5156/api/v1/")!
        return URL(string: "http://192.168.10.13:5156/api/v1/")!
    }
    
    func buildURLRequest() -> URLRequest{
        let url = baseURL.appendingPathComponent(path)
        var components = URLComponents(
            url: url, resolvingAgainstBaseURL: true
        )
        
        switch method {
        case .get:
            if self.queryItems.count > 0{
                components?.queryItems = queryItems
            }
        case .post: break
            
        default:
            fatalError()
        }
        
        var urlRequest = URLRequest(url:url)
        urlRequest.url = components?.url
        urlRequest.httpMethod  = method.rawValue
        

        return urlRequest
    }
    
    func response(from data: Data,
                  urlResponse : HTTPURLResponse) throws -> Response{
        let decoder = JSONDecoder()
        
        print(urlResponse.statusCode)
        if(200..<300).contains(urlResponse.statusCode){
            return try decoder.decode(Response.self, from: data)
        }else{
            return try decoder.decode(Response.self, from: data)
        }
    }
}
