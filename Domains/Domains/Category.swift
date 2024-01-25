//
//  Category.swift
//  Domains
//
//  Created by George Dambara on 2024/01/26.
//

import Foundation

///カテゴリー
public struct Category : Codable, Equatable {
    public let id:Int;
    public let name:String;
    public let image:String?;
    
    public init(id: Int, name: String, image: String?) {
        self.id = id
        self.name = name
        self.image = image
    }
    
    public func toJson() -> String{
        let data = try! JSONEncoder().encode(self);
        return String(data: data, encoding: .utf8)!;
    }
}
