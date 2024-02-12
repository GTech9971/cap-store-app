//
//  CategoryFetcher.swift
//  CapStore
//
//  Created by George Dambara on 2024/02/12.
//

import Foundation
import Domains


/// カテゴリー取得
class CategoryFetcher{
    let client : CapStoreClient;
    
    init() {
        self.client = CapStoreClient(httpClient: URLSession.shared)
    }
    
    
    /// 全カテゴリー取得
    /// - Returns: 全カテゴリー
    func fetchAllAsync() async throws -> BaseResponse<Domains.Category>{
        let request : FetchAllCategoryAPIRequest = FetchAllCategoryAPIRequest();
        let response : FetchAllCategoryAPIRequest.Response = try await self.client.sendAsync(request: request);
        return response;
    }
}
