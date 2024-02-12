//
//  FetchAllCategoryTest.swift
//  DomainsTests
//
//  Created by George Dambara on 2024/02/12.
//

import XCTest

@testable import Domains

final class FetchAllCategoryTest: XCTestCase {

    let client : CapStoreClient = CapStoreClient(httpClient: URLSession.shared)
    
    func testFetch() async throws{
        let request = FetchAllCategoryAPIRequest()
        
        let response = try await client.sendAsync(request: request)
        
        XCTAssertEqual(true, response.success)
    }

}
