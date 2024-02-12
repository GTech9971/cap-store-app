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
    
    
    func testFetchAsync() async throws {
        let request = FetchComponentAPIRequest(pageIndex: 0, pageSize: 10)
        let response = try await capStoreClient.sendAsync(request: request)
        XCTAssertEqual(true, response.success)
    }
    
    func testFetchByCatalogIdAsync() async throws{
        let request = FetchCatalogAPIRequest(catalogId: CatalogId(id: "XXX"))
        let response = try await capStoreClient.sendAsync(request: request)
        XCTAssertEqual(false, response.success)
        XCTAssertEqual("C400", response.errors?.first?.code)
    }
    
    func testFetchByCatalogIdAsyncSuccess() async throws{
        let request = FetchCatalogAPIRequest(catalogId: CatalogId(id: "104430"))
        let response = try await capStoreClient.sendAsync(request: request)
        XCTAssertEqual(true, response.success)
    }
}
