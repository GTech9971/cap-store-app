//
//  ComponentTests.swift
//  DomainsTests
//
//  Created by George Dambara on 2024/01/26.
//

import XCTest
@testable import Domains

final class ComponentTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSuccessJsonEncodeDecode() throws {
        let id : Int = 0;
        let name : String = "PIC16F18444";
        let modelName : String = "PIC16F18444 - I/P";
        let description : String = "description...";
        let images : [String] = ["http://example.com"];
        
        let fromJson = "{\"name\":\"sample\",\"image\":\"http://example.com\",\"id\":0}";
        let fromJsonData = fromJson.data(using: .utf8)!
        
        let category = try! JSONDecoder().decode(Category.self, from: fromJsonData);
        let maker = try! JSONDecoder().decode(Maker.self, from: fromJsonData);
        
        let component = Component(componentId: id, name: name, modelName: modelName, description: description, category: category, maker: maker, images: images)
        
        let json : String = component.toJson()
        print(json)
        
        let jsonData = json.data(using: .utf8)!
        let fromJsonComponent = try! JSONDecoder().decode(Component.self, from: jsonData)
        
        XCTAssertEqual(component.componentId, fromJsonComponent.componentId)
        XCTAssertEqual(component.name, fromJsonComponent.name)
        XCTAssertEqual(component.modelName, fromJsonComponent.modelName)
        XCTAssertEqual(component.description, fromJsonComponent.description)
        XCTAssertEqual(component.maker, fromJsonComponent.maker)
        XCTAssertEqual(component.category, fromJsonComponent.category)
        XCTAssertEqual(component.images, fromJsonComponent.images)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
