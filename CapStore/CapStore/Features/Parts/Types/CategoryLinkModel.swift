//
//  CategoryLinkModel.swift
//  CapStore
//
//  Created by George Dambara on 2024/02/05.
//

import Foundation

public struct CategoryLinkModel : Identifiable, Hashable{
    public let id = UUID()
    public let name : String
    public let image : String?
    
    public init(name: String, image: String?) {
        self.name = name
        self.image = image
    }
    
    public static let SAMPLES : [CategoryLinkModel] = [
        CategoryLinkModel(name: "マイコン関連", image: "globe"),
        CategoryLinkModel(name: "電子工作便利グッツ", image: "globe"),
        CategoryLinkModel(name: "半導体", image: "globe"),
        CategoryLinkModel(name: "LED", image: "globe"),
        CategoryLinkModel(name: "センサー", image: "globe")
    ]

}
