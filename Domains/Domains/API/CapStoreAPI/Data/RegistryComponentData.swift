//
//  RegistryComponentData.swift
//  Domains
//
//  Created by George Dambara on 2024/02/13.
//

import Foundation

/// 電子部品登録データ
public struct RegistryComponentData : Codable{
    public let name : String;
    public let modelName:String;
    public let description : String;
    public let categoryId:Int;
    public let makerId:Int;
    public let images:[String]?;
    
    public init(name: String, modelName: String, description: String, categoryId: Int, makerId: Int, images: [String]?) {
        self.name = name
        self.modelName = modelName
        self.description = description
        self.categoryId = categoryId
        self.makerId = makerId
        self.images = images
    }
}
