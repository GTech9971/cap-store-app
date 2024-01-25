//
//  ErrorResponse.swift
//  Domains
//
//  Created by George Dambara on 2024/01/26.
//

import Foundation

public struct ErrorData : Codable{
    public let code: String;
    public let message: String;
    public let stack: String?;
    
    public init(code: String, message: String, stack: String?) {
        self.code = code
        self.message = message
        self.stack = stack
    }
}
