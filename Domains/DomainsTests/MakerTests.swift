//
//  DomainsTests.swift
//  DomainsTests
//
//  Created by George Dambara on 2024/01/24.
//

import XCTest
@testable import Domains

final class MakerTests: XCTestCase {

    func testSuccessJsonEncodeDecode() throws {
        let id : Int = 0;
        let name : String = "sample";
        let image : String? = "http://example.com";
        let maker = Maker(makerId: id, name: name, image: image)
        
        let json = maker.toJson()
        print(json)
        
        let fromJson = "{\"name\":\"sample\",\"image\":\"http://example.com\",\"makerId\":0}";
        let fromJsonData = fromJson.data(using: .utf8)!
        
        let fromJsonMaker = try! JSONDecoder().decode(Maker.self, from: fromJsonData);
        
        XCTAssertEqual(maker.makerId, fromJsonMaker.makerId)
        XCTAssertEqual(maker.name, fromJsonMaker.name)
        XCTAssertEqual(maker.image, fromJsonMaker.image)
    }

}
