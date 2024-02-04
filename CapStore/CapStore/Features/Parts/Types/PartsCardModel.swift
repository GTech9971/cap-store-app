//
//  PartsCardModel.swift
//  CapStore
//
//  Created by George Dambara on 2024/02/05.
//

import Foundation

///電子部品カードモデル
public struct PartsCardModel{
    public let name : String;
    public let modelName : String;
    public let makerName : String;
    
    public init(name: String, modelName: String, makerName: String) {
        self.name = name
        self.modelName = modelName
        self.makerName = makerName
    }
}
