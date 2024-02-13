//
//  ComponentRegister.swift
//  CapStore
//
//  Created by George Dambara on 2024/02/13.
//

import Foundation
import Domains


/// 電子部品登録
class ComponentRegister{
    let client : CapStoreClient = CapStoreClient(httpClient: URLSession.shared)
    
    /// 電子部品登録APIを実行する
    /// - Parameter data: 登録内容
    /// - Returns: 登録された電子部品ID
    func registryAsync(data:RegistryComponentData) async throws -> BaseResponse<RegistryComponentResponseData>{
        let request : RegistryComponentAPIRequest = RegistryComponentAPIRequest(request: data);
        let response : RegistryComponentAPIRequest.Response = try await self.client.sendAsync(request: request)
        return response;
    }
}
