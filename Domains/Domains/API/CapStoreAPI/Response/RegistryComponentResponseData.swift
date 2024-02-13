//
//  RegistryComponentResponseData.swift
//  Domains
//
//  Created by George Dambara on 2024/02/13.
//

import Foundation

/// 電子部品登録レスポンスデータ
public struct RegistryComponentResponseData : Codable{
    public let id : Int
    
    public init(id: Int) {
        self.id = id
    }
}
