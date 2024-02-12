//
//  FetchAllCategoryAPIRequest.swift
//  Domains
//
//  Created by George Dambara on 2024/02/12.
//

import Foundation

public struct FetchAllCategoryAPIRequest : APIRequest{
    
    public typealias Response = BaseResponse<Category>
    
    public var body: Encodable?{
        return nil
    }
    
    public init(){}
    
    public var method: HTTPMethod{
        return .get
    }
    
    public var path:String{
        return "categories"
    }
    
    public var queryItems: [URLQueryItem]{
        return []
    }
}
