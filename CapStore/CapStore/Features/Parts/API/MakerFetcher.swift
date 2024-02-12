//
//  MakerFetcher.swift
//  CapStore
//
//  Created by George Dambara on 2024/02/12.
//

import Foundation
import Domains

class MakerFetcher{
    let client: CapStoreClient;
    
    init() {
        self.client = CapStoreClient(httpClient: URLSession.shared)
    }
    
    /// 全メーカーを取得する
    /// - Returns: 全メーカー
    func fetchAllAsync() async throws -> BaseResponse<Maker>{
        let request : FetchAllMakerAPIRequest = FetchAllMakerAPIRequest();
        let response : FetchAllMakerAPIRequest.Response = try await self.client.sendAsync(request: request)
        return response;
    }
}
