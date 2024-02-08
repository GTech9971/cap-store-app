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
    
    public func send<Request: APIRequest>(
        request: Request,
        completion: @escaping (Result<Request.Response, ErrorData>) -> Void) {
            
            let errorData:ErrorData = ErrorData(code:"", message: "", stack: nil)
            let urlRequest = request.buildURLRequest()
            httpClient.sendRequest(urlRequest) { result in
                switch result{
                case .success((let data, let urlResponse)):
                    do{
                        let response = try request.response(from: data, urlResponse: urlResponse)
                        print(response)
                        completion(Result.success(response))
                    }catch let error as ErrorData{
                        //TODO
                        print(error)
                        completion(Result.failure(errorData))
                    }catch{
                        //TODO
                        print(error)
                        completion(Result.failure(errorData))
                    }
                case .failure(_):
                    completion(.failure(errorData))
                }
            }
        }
    
    
    public func sendAsync<Request: APIRequest>(request: Request) async throws -> Request.Response{
        let urlRequest = request.buildURLRequest()
        let (data, urlResponse) : (Data, HTTPURLResponse) = try await httpClient.sendRequestAsync(urlRequest)
        return try request.response(from:data, urlResponse: urlResponse)
    }
}
