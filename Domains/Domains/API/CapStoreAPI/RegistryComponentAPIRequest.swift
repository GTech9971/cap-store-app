//
//  RegistryComponentAPIRequest.swift
//  Domains
//
//  Created by George Dambara on 2024/02/13.
//

import Foundation


/// 電子部品登録リクエスト
public struct RegistryComponentAPIRequest : APIRequest{
    
    private let request:RegistryComponentData;
    
    public var body: Encodable?{
        return self.request
    }
    

    public init(request:RegistryComponentData){
        self.request = request;
    }
    
    public typealias Response = BaseResponse<RegistryComponentResponseData>
    
    public var method: HTTPMethod{
        return .post
    }
    
    public var path:String{
        return "components"
    }
    
    public var queryItems: [URLQueryItem]{
        return []
    }
}
