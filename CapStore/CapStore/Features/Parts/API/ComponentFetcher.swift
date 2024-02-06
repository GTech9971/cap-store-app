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
    
    func fetch(pageIndex:Int = 0, pageSize : Int = 10,  completion: @escaping (BasePageResponse<Component>) -> Void) throws{
        let request = try FetchComponentAPIRequest(pageIndex: pageIndex, pageSize: pageSize)
        capStoreClient.send(request: request) { result in
            switch result{
            case .success(let response):
                completion(response)
            case .failure(let error):
                print(error)
            default:
                print("Error")
            }
        }
    }
}
