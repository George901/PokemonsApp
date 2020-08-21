//
//  PokemonsApiClient.swift
//  Pokemons
//
//  Created by Georgiy Farafonov on 10.08.2020.
//  Copyright © 2020 Georgiy Farafonov. All rights reserved.
//

import UIKit

class PokemonsApiClient: NSObject, PokemonsApi {

    private var apiClient: RestApi
    
    init(apiClient: RestApi) {
        self.apiClient = apiClient
        super.init()
    }
    
    func loadPokemonDetails(pokemonId: Int, onSuccess: SuccessBlock<Pokemon>?, onError: ErrorBlock?) {
        apiClient.get(url: URL(string: "https://pokeapi.co/api/v2/pokemon/\(pokemonId)")!,
                      parameters: nil,
                      onSuccess: {(json) in
                        JsonParser(json: json).parseObject(mappable: Pokemon.self, onSuccess: onSuccess, onError: onError)
                        },
                      onError: onError)
    }
    
}
