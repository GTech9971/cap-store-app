//
//  ComponentFetcher.swift
//  CapStore
//
//  Created by George Dambara on 2024/02/06.
//

import Foundation
import Domains

class ComponentFetcher{
    
    var capStoreClient: CapStoreClient!

    init() {
        self.capStoreClient = CapStoreClient(httpClient: URLSession.shared)
    }
    
    func fetch(completion: @escaping ([Component]) -> Void) throws{
        let request = try FetchComponentAPIRequest(pageIndex: 0, pageSize: 10)
        capStoreClient.send(request: request) { result in
            switch result{
            case .success(let response):
                completion(response.data.map{$0!})
            case .failure(let error):
                print(error)
            default:
                print("Error")
            }
        }
    }
}
