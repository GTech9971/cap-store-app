//
//  HTTPClient.swift
//  Domains
//
//  Created by George Dambara on 2024/01/28.
//

import Foundation

public protocol HTTPClient{
    func sendRequest(_ urlRequest: URLRequest,
                     completion: @escaping (Result<(Data, HTTPURLResponse), Error>) -> Void)
}

extension URLSession : HTTPClient{
    
    public func sendRequest(_ urlRequest: URLRequest, completion: @escaping (Result<(Data, HTTPURLResponse), Error>) -> Void) {
        print(urlRequest.url)
        let task = dataTask(with: urlRequest){ data, urlResponse, error in
            switch(data, urlResponse, error){
            case (_,_,let error?):
                completion(Result.failure(error))
            case (let data?, let urlResponse as HTTPURLResponse, _):
                completion(Result.success((data, urlResponse)))
            default:
                fatalError("invalid responsecombination \(String(describing: (data, urlResponse, error))).")
            }
        }
        
        task.resume()
    }
}
