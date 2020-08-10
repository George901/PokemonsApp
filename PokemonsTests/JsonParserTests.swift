//
//  JsonParserTests.swift
//  PokemonsTests
//
//  Created by Georgiy Farafonov on 10.08.2020.
//  Copyright © 2020 Georgiy Farafonov. All rights reserved.
//

import XCTest
@testable import Pokemons
import ObjectMapper

class FakeMappableObject: NSObject, Mappable {
    
    var userId: Int = 0
    var title: String = ""
    var body: String = ""
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        userId <- map["userId"]
        title  <- map["title"]
        body   <- map["body"]
    }
    
}

class JsonParserTests: XCTestCase {

    let objectJson: [String : Any] = ["userId" : 1, "title" : "fake user 1", "body" : "fake user 1 description"]
    
    let objectJsonArray: [[String : Any]] = [
        ["userId" : 1, "title" : "fake user 1", "body" : "fake user 1 description"],
        ["userId" : 2, "title" : "fake user 2", "body" : "fake user 2 description"],
        ["userId" : 3, "title" : "fake user 3", "body" : "fake user 3 description"]
    ]
    
    func testParserShouldParseSingleObjectWithNoChildObjects() {
        JsonParser(json: objectJson)
            .parseObject(mappable: FakeMappableObject.self, onSuccess: { (object) in
                XCTAssertNotNil(object)
                XCTAssertEqual(object?.title, "fake user 1")
            }, onError: nil)
    }
    
    func testParserShouldParseArrayOfObjectsNoChildObjects() {
        JsonParser(json: objectJsonArray)
            .parseArray(mappable: FakeMappableObject.self, onSuccess: { (objects) in
                XCTAssertNotNil(objects)
                XCTAssertEqual(objects?.count, 3)
                XCTAssertEqual(objects?.last?.body, "fake user 3 description")
            }, onError: nil)
    }
    
    func testParserShouldCallErrorHandlerWithWrongDataErrorWithArrayPassedToSingleObjectMethod() {
        JsonParser(json: objectJsonArray)
            .parseObject(mappable: FakeMappableObject.self, onSuccess: nil, onError: { (error) in
                XCTAssertEqual(error as? JsonParserError, JsonParserError.wrongDataFormatError)
            })
    }
    
    func testParserShouldCallErrorHandlerWithWrongDataErrorWithSingleObjectPassedToArrayMethod() {
        JsonParser(json: objectJson)
            .parseArray(mappable: FakeMappableObject.self, onSuccess: nil, onError: { (error) in
                XCTAssertEqual(error as? JsonParserError, JsonParserError.wrongDataFormatError)
            })
    }
    
}
