//
//  CatalogId.swift
//  Domains
//
//  Created by George Dambara on 2024/01/26.
//

import Foundation

///カテゴリーID
public struct CatalogId : Codable, Equatable{
    
//    private let LENGTH : Int = 7
//    private let PATTERN : Regex = /^[A-Z]-\d{5}$/
    
    public let id : String;
    
    public init(id: String) {
//        if(id.count != LENGTH){
//            throw ModelError.argumentIndexOutOfRangeError(message: "IDの長さが不正です")
//        }
//        
//        guard let match = id.firstMatch(of: PATTERN) else {
//            throw ModelError.argumentError(message: "カテゴリーIDの形式が不正です")
//        }
        
        self.id = id
    }
}
