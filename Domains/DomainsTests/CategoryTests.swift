//
//  CategoryTests.swift
//  DomainsTests
//
//  Created by George Dambara on 2024/01/26.
//

import XCTest
@testable import Domains

final class CategoryTests: XCTestCase {

    func testSuccessEncodeDecode() throws {
        let id : Int = 7;
        let name : String = "sample";
        let image : String? = "http://example.com";
        let category = Category(categoryId: id, name: name, image: image)
        
        let json = category.toJson()
        print(json)
        
        let fromJson = "{\"name\":\"sample\",\"image\":\"http://example.com\",\"categoryId\":7}";
        let fromJsonData = fromJson.data(using: .utf8)!
        
        let fromJsonCategory = try! JSONDecoder().decode(Category.self, from: fromJsonData);
        
        XCTAssertEqual(category.categoryId, fromJsonCategory.categoryId)
        XCTAssertEqual(category.name, fromJsonCategory.name)
        XCTAssertEqual(category.image, fromJsonCategory.image)
    }

}
