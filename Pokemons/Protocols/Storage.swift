//
//  Storage.swift
//  Pokemons
//
//  Created by Georgiy Farafonov on 20.08.2020.
//  Copyright © 2020 Georgiy Farafonov. All rights reserved.
//

import Foundation

protocol Storage {
    func loadItems() -> [Pokemon]
}
