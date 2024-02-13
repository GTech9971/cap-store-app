//
//  CapStoreClient.swift
//  Domains
//
//  Created by George Dambara on 2024/01/28.
//
import Foundation

public class CapStoreClient {
    private let httpClient: HTTPClient
    
    public init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
    
    public func sendAsync<Request: APIRequest>(request: Request) async throws -> Request.Response{
        var urlRequest = request.buildURLRequest()
        
        if let request = request.body{
            if let json = try? JSONEncoder().encode(request){
                urlRequest.setValue("Application/json", forHTTPHeaderField: "Content-Type")
                urlRequest.httpBody = json
            }
        }
        
        let (data, urlResponse) : (Data, HTTPURLResponse) = try await httpClient.sendRequestAsync(urlRequest)
        return try request.response(from:data, urlResponse: urlResponse)
    }
}
