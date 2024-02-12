//
//  BasePageResponse.swift
//  Domains
//
//  Created by George Dambara on 2024/02/06.
//

import Foundation


///
///ページレスポンス
public struct BasePageResponse<T:Codable> : Codable{
    public let pageIndex: Int;
    public let pageSize: Int;
    public let totalCount: Int;
    public let totalPages : Int;
    public let hasPreviousPage : Bool;
    public let hasNextPage : Bool;
    
    public let success: Bool;
    public let data:[T]?;
    public let errors:[ErrorData]?;
    
    public init(pageIndex: Int, pageSize: Int, totalCount: Int, totalPages: Int, hasPreviousPage: Bool, hasNextPage: Bool, success: Bool, data: [T]?, errors: [ErrorData]?) {
        self.pageIndex = pageIndex
        self.pageSize = pageSize
        self.totalCount = totalCount
        self.totalPages = totalPages
        self.hasPreviousPage = hasPreviousPage
        self.hasNextPage = hasNextPage
        self.success = success
        self.data = data
        self.errors = errors
    }
}
