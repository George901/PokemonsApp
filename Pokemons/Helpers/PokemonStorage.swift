//
//  PokemonStorage.swift
//  Pokemons
//
//  Created by Georgiy Farafonov on 20.08.2020.
//  Copyright © 2020 Georgiy Farafonov. All rights reserved.
//

import UIKit

class PokemonStorage: NSObject, Storage {
    
    var items: [Pokemon] = []
    
    func loadItems() {
        do {
            let parser = try CSVParser(contentsOf: Bundle.main.url(forResource: "pokemon", withExtension: ".csv"))
            parseItemsFrom(parser)
        } catch let error {
            print(error)
        }
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