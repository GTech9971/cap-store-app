//
//  HTTPClient.swift
//  Domains
//
//  Created by George Dambara on 2024/01/28.
//

import Foundation

public protocol HTTPClient{
    
    func sendRequestAsync(_ urlRequest: URLRequest) async throws -> (Data, HTTPURLResponse)
}

extension URLSession : HTTPClient{

    public func sendRequestAsync(_ urlRequest: URLRequest) async throws -> (Data, HTTPURLResponse) {
        print(urlRequest.url ?? "")
        
        let (data,urlResponse) = try await URLSession.shared.data(for: urlRequest)
        
        guard let httpResponse = urlResponse as? HTTPURLResponse else {
            fatalError("Invalid response: \(String(describing: urlResponse))")
        }
        
        return (data, httpResponse)
    }
}
