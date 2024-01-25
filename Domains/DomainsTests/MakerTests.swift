//
//  DomainsTests.swift
//  DomainsTests
//
//  Created by George Dambara on 2024/01/24.
//

import XCTest
@testable import Domains

final class MakerTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSuccessJsonEncodeDecode() throws {
        let id : Int = 0;
        let name : String = "sample";
        let image : String? = "http://example.com";
        let maker = Maker(id: id, name: name, image: image)
        
        let json = maker.toJson()
        print(json)
        
        let fromJson = "{\"name\":\"sample\",\"image\":\"http://example.com\",\"id\":0}";
        let fromJsonData = fromJson.data(using: .utf8)!
        
        let fromJsonMaker = try! JSONDecoder().decode(Maker.self, from: fromJsonData);
        
        XCTAssertEqual(maker.id, fromJsonMaker.id)
        XCTAssertEqual(maker.name, fromJsonMaker.name)
        XCTAssertEqual(maker.image, fromJsonMaker.image)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
