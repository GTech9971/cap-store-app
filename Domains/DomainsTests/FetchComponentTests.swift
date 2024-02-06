//
//  FetchComponentTests.swift
//  DomainsTests
//
//  Created by George Dambara on 2024/02/06.
//

import Foundation
import XCTest
@testable import Domains

final class FetchComponentTests: XCTestCase {

    var capStoreClient: CapStoreClient!

    
    override func setUp() {
        super.setUp()
        capStoreClient = CapStoreClient(httpClient: URLSession.shared)
    }
    
    func testFetchSuccess() async throws {
        let request = try FetchComponentAPIRequest(pageIndex: 0, pageSize: 10)
        let expectation = expectation(description: "")
        
        capStoreClient.send(request: request) { result in
            switch result{
            case .success(let response):
                XCTAssertEqual(true, response.success)
                XCTAssertEqual(nil, response.errors)
            default:
                print("")
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 30)
    }
}
