//
//  CSVParser.swift
//  Pokemons
//
//  Created by Georgiy Farafonov on 08.08.2020.
//  Copyright © 2020 Georgiy Farafonov. All rights reserved.
//

import Foundation

enum CSVParserError: Error {
    case nilUrlError
    case contentNotFoundError
}

class CSVParser: NSObject {
    
    private(set) var lines: [String] = []
    private(set) var headers: [String] = []
    private(set) var rows: [[String : String]] = []
    
    init(contentsOf url: URL?) throws {
        guard let url = url else { throw CSVParserError.nilUrlError }
        guard let content = try? String(contentsOf: url, encoding: String.Encoding.utf8) else { throw CSVParserError.contentNotFoundError }
        super.init()
        parse(content)
    }
    
    private func parse(_ content: String) {
        parseLines(from: content)
        parseHeaders()
        parseRows()
    }
    
    private func parseLines(from content: String) {
        lines = content.components(separatedBy: "\n").filter({!$0.isEmpty})
    }
    
    private func parseHeaders() {
        headers = lines.removeFirst().components(separatedBy: ",")
    }
    
    private func parseRows() {
        for line in lines {
            var currentRow: [String : String] = [:]
            let lineElements: [String] = line.components(separatedBy: ",")
            for (index, header) in headers.enumerated() {
                currentRow[header] = index < lineElements.count ? lineElements[index] : ""
            }
            rows.append(currentRow)
        }
    }
    
}
