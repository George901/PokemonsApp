//
//  PokemonStorage.swift
//  Pokemons
//
//  Created by Georgiy Farafonov on 20.08.2020.
//  Copyright © 2020 Georgiy Farafonov. All rights reserved.
//

import UIKit

class PokemonStorage: NSObject, Storage {
    
    private var items: [Pokemon] = []
    
    func loadItems() -> [Pokemon] {
        do {
            let parser = try CSVParser(contentsOf: Bundle.main.url(forResource: "pokemon", withExtension: ".csv"))
            parseItemsFrom(parser)
        } catch let error {
            print(error)
        }
        return items
    }
    
    private func parseItemsFrom(_ parser: CSVParser) {
        let rows = parser.rows
        for row in rows {
            let pokeId = Int(row["id"]!)!
            let name = row["identifier"]!
            let poke = Pokemon(name: name, id: pokeId)
            items.append(poke)
        }
    }
    
}
