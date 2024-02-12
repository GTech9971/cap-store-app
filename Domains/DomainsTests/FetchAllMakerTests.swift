//
//  FetchAllMakerTests.swift
//  DomainsTests
//
//  Created by George Dambara on 2024/02/12.
//

import XCTest

@testable import Domains

final class FetchAllMakerTests: XCTestCase {

    let client : CapStoreClient = CapStoreClient(httpClient: URLSession.shared)
    
    func testFetchAllAsync() async throws{
        let request = FetchAllMakerAPIRequest()
        
        let response = try await client.sendAsync(request: request)
        
        XCTAssertEqual(true, response.success)
    }

}
