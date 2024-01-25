//
//  FetchCatalogAPIRequest.swift
//  Domains
//
//  Created by George Dambara on 2024/01/26.
//

import Foundation

public struct FetchCatalogAPIRequest : APIRequest{
    
    public var body: Encodable?{
        return nil
    }
    
    public let catalogId:CatalogId
    
    public typealias Response = BaseResponse<Component>
    
    public var method: HTTPMethod{
        return .get
    }
    
    public var path:String{
        return "/akizuki/catalogs/\(catalogId.id)"
    }
    
    public var queryItems: [URLQueryItem]{
        return []
    }
    
}
