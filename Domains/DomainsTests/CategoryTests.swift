//
//  CategoryTests.swift
//  DomainsTests
//
//  Created by George Dambara on 2024/01/26.
//

import XCTest
@testable import Domains

final class CategoryTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSuccessEncodeDecode() throws {
        let id : Int = 0;
        let name : String = "sample";
        let image : String? = "http://example.com";
        let category = Category(id: id, name: name, image: image)
        
        let json = category.toJson()
        print(json)
        
        let fromJson = "{\"name\":\"sample\",\"image\":\"http://example.com\",\"id\":0}";
        let fromJsonData = fromJson.data(using: .utf8)!
        
        let fromJsonCategory = try! JSONDecoder().decode(Category.self, from: fromJsonData);
        
        XCTAssertEqual(category.id, fromJsonCategory.id)
        XCTAssertEqual(category.name, fromJsonCategory.name)
        XCTAssertEqual(category.image, fromJsonCategory.image)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
