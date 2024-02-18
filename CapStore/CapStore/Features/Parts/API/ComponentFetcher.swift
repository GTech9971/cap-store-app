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
    
    func fetchAsync(pageIndex:Int = 0, pageSize: Int = 10, categoryId: Int? = nil) async throws -> BasePageResponse<Component>{
        let request : FetchComponentAPIRequest = FetchComponentAPIRequest(pageIndex: pageIndex, pageSize: pageSize, categoryId: categoryId)
        let response : FetchComponentAPIRequest.Response = try await self.capStoreClient.sendAsync(request: request)
        return response
    }
    
    func fetchByCatalogIdAsync(catalogId: CatalogId) async throws -> BaseResponse<Component>{
        let request = FetchCatalogAPIRequest(catalogId: catalogId)
        let response : FetchCatalogAPIRequest.Response = try await self.capStoreClient.sendAsync(request: request)
        return response
    }
}
