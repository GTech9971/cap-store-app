//
//  CapStoreClientTests.swift
//  DomainsTests
//
//  Created by George Dambara on 2024/01/28.
//

import Foundation
import XCTest
@testable import Domains

class CapStoreClientTests : XCTestCase{
    
    
    var capStoreClient: CapStoreClient!
    
    override func setUp() {
        super.setUp()
        capStoreClient = CapStoreClient(httpClient: URLSession.shared)
    }
    
    func testSuccess() async throws {
        let request = try FetchCatalogAPIRequest(catalogId: CatalogId(id: "I-18237"))
        let expectation = expectation(description: "")
        capStoreClient.send(request: request) { result in
            switch result{
            case .success(let response):
                XCTAssertEqual(true, response.success)
                XCTAssertEqual(nil, response.errors)
                let component = response.data[0]
                XCTAssertEqual("ＰＩＣマイコン ＰＩＣ１６Ｆ１８４４４－Ｉ／Ｐ", component?.name)
            default:
                print("")
            }
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 30)
    }
}
