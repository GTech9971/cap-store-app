//
//  BaseResponse.swift
//  Domains
//
//  Created by George Dambara on 2024/01/26.
//

import Foundation

public struct BaseResponse<T:Codable> : Codable{
    public let success: Bool;
    public let data:T?;
    public let errors:[ErrorData];
    
    public init(success: Bool, data: T, errors: [ErrorData]) {
        self.success = success
        self.data = data
        self.errors = errors
    }
}
