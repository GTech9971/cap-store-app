//
//  FetchComponentAPIRequest.swift
//  Domains
//
//  Created by George Dambara on 2024/02/06.
//

import Foundation

///
///電子部品取得リクエスト
public struct FetchComponentAPIRequest : APIRequest{
    
    public typealias Response = BasePageResponse<Component>
    
    public var body:Encodable?{
        return nil
    }
    
    public let pageIndex : Int
    public let pageSize : Int
    public let categoryId : Int?
    
    public init(pageIndex: Int, pageSize: Int, categoryId: Int? = nil) {
        self.pageIndex = pageIndex
        self.pageSize = pageSize
        self.categoryId = categoryId
    }
    
    public var method : HTTPMethod{
        return .get
    }
    
    public var path:String{
        return "components"
    }
    
    public var queryItems: [URLQueryItem]{
        var items = [
            URLQueryItem(name:"pageIndex", value:String(pageIndex)),
            URLQueryItem(name:"pageSize", value: String(pageSize))
        ]
        
        if let categoryId : Int = self.categoryId{
            items.append(URLQueryItem(name:"filterColumn", value: "CategoryId"))
            items.append(URLQueryItem(name:"filterQuery", value: String(categoryId)))
        }
        
        return items;
    }
}
