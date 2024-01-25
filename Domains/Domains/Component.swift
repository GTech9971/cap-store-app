//
//  Component.swift
//  Domains
//
//  Created by George Dambara on 2024/01/26.
//

import Foundation

///
///電子部品
public struct Component : Codable, Equatable {
    public let componentId : Int;
    public let name : String;
    public let modelName : String;
    public let description : String;
    public let category : Category;
    public let maker : Maker;
    public let images: [String];
    
    public init(componentId: Int, name: String, modelName: String, description: String, category: Category, maker: Maker, images: [String]) {
        self.componentId = componentId
        self.name = name
        self.modelName = modelName
        self.description = description
        self.category = category
        self.maker = maker
        self.images = images
    }
    
    public func toJson() -> String{
        let data = try! JSONEncoder().encode(self);
        return String(data: data, encoding: .utf8)!;
    }
}
