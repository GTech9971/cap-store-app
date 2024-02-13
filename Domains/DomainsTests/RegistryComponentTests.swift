//
//  RegistryComponentTests.swift
//  DomainsTests
//
//  Created by George Dambara on 2024/02/13.
//

import XCTest

//
//  FetchComponentTests.swift
//  DomainsTests
//
//  Created by George Dambara on 2024/02/06.
//

import Foundation
import XCTest
@testable import Domains

final class RegistryComponentTests: XCTestCase {

    let client: CapStoreClient =  CapStoreClient(httpClient: URLSession.shared)

    func testRegistryAsync() async throws {
        let body : RegistryComponentData = RegistryComponentData(
            name: "Sample",
            modelName: "SampleModel",
            description: "Sample Description",
            categoryId: 1,
            makerId: 1,
            images: ["https://akizukidenshi.com/img/goods/L/115154.jpg"])
        
        let request = RegistryComponentAPIRequest(request: body)
        let response = try await client.sendAsync(request: request)
        XCTAssertEqual(true, response.success)
    }
}
