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
    
    public init(pageIndex: Int, pageSize: Int) {
        self.pageIndex = pageIndex
        self.pageSize = pageSize
    }
    
    public var method : HTTPMethod{
        return .get
    }
    
    public var path:String{
        return "components"
    }
    
    public var queryItems: [URLQueryItem]{
        return [
            URLQueryItem(name:"pageIndex", value:String(pageIndex)),
            URLQueryItem(name:"pageSize", value: String(pageSize))
        ]
    }
}
