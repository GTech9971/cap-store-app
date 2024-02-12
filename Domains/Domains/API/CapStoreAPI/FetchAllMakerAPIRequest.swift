//
//  FetchAllMakerAPIRequest.swift
//  Domains
//
//  Created by George Dambara on 2024/02/12.
//

import Foundation

public struct FetchAllMakerAPIRequest : APIRequest{
    
    public var body: Encodable?{
        return nil
    }
    

    public init(){}
    
    public typealias Response = BaseResponse<Maker>
    
    public var method: HTTPMethod{
        return .get
    }
    
    public var path:String{
        return "makers"
    }
    
    public var queryItems: [URLQueryItem]{
        return []
    }
    
}
