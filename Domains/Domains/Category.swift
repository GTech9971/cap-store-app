//
//  Category.swift
//  Domains
//
//  Created by George Dambara on 2024/01/26.
//

import Foundation

///カテゴリー
public struct Category : Codable, Equatable, Identifiable, Hashable{
    public var id:UUID = UUID()
    public let categoryId:Int;
    public let name:String;
    public let image:String?;
    
    public init(categoryId: Int, name: String, image: String?) {
        self.categoryId = categoryId
        self.name = name
        self.image = image
    }
    
    public func toJson() -> String{
        let data = try! JSONEncoder().encode(self);
        return String(data: data, encoding: .utf8)!;
    }
    
    public enum CodingKeys : String, CodingKey{
        case categoryId
        case name
        case image
    }
        
    public static let SAMPLES : [Domains.Category] = [
        Domains.Category(categoryId: 0, name: "半導体", image: nil),
        Domains.Category(categoryId:1, name:"マイコン", image:nil)
    ]
}
