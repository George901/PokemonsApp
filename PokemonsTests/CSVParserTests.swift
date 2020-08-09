//
//  CSVParserTests.swift
//  PokemonsTests
//
//  Created by Georgiy Farafonov on 08.08.2020.
//  Copyright © 2020 Georgiy Farafonov. All rights reserved.
//

import XCTest
@testable import Pokemons

class CSVParserTests: XCTestCase {
    
    var bundle: Bundle!
    var parser: CSVParser!
    
    override func setUp() {
        bundle = Bundle(for: type(of: self))
        parser = try! CSVParser(contentsOf: bundle.url(forResource: "testCSV", withExtension: "csv"))
    }
    
    func testParserShouldRemoveHeadersLineAfterParsing() {
        XCTAssertEqual(parser.lines.count, 5)
        XCTAssertEqual(parser.lines[0], "1,bulbasaur,1,7,69,64,1,1")
    }
    
    func testParserShouldParseTableHeaders() {
        XCTAssertEqual(parser.headers.count, 8)
        XCTAssertEqual(parser.headers[0], "id")
    }
    
    func testParserShouldParseRowsInCorrenspondenceWithHeaders() {
        XCTAssertEqual(parser.rows.count, 5)
        XCTAssertEqual(parser.rows[0], ["id": "1", "identifier": "bulbasaur", "order": "1", "species_id": "1", "height": "7", "weight": "69", "is_default": "1", "base_experience": "64"])
    }
    
    func testParserShouldThrowNilUrlErrorOnInitWithNilUrl() {
        XCTAssertThrowsError(try CSVParser(contentsOf: nil), "") { (error) in
            XCTAssertEqual(error as? CSVParserError, CSVParserError.nilUrlError)
        }
    }
    
    func testParserShouldThrowEmptyContentErrorIfThereIsNoContentFromUrl() {
        XCTAssertThrowsError(try CSVParser(contentsOf: URL(string: "file:///")), "") { (error) in
            XCTAssertEqual(error as? CSVParserError, CSVParserError.contentNotFoundError)
        }
    }
    
    func testParserShouldNotBeInitializedWithNilUrl() {
        XCTAssertNil(try? CSVParser(contentsOf: nil))
    }
    
}
