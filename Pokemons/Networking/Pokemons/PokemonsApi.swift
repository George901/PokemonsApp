//
//  PokemonsApi.swift
//  Pokemons
//
//  Created by Georgiy Farafonov on 10.08.2020.
//  Copyright © 2020 Georgiy Farafonov. All rights reserved.
//

import Foundation

protocol PokemonsApi {
    func loadPokemonDetails(pokemonId: Int, onSuccess: SuccessBlock<Pokemon>?, onError: ErrorBlock?)
}
