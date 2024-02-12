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
        let urlRequest = request.buildURLRequest()
        let (data, urlResponse) : (Data, HTTPURLResponse) = try await httpClient.sendRequestAsync(urlRequest)
        return try request.response(from:data, urlResponse: urlResponse)
    }
}
