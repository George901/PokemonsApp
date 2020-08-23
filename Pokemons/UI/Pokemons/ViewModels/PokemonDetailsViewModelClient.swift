//
//  PokemonDetailedViewModel.swift
//  Pokemons
//
//  Created by Georgiy Farafonov on 20.08.2020.
//  Copyright © 2020 Georgiy Farafonov. All rights reserved.
//

import UIKit

protocol PokemonDetailsViewModel {
    var pokemon: Pokemon { get set }
    var onUpdateDetails: (() -> ())? { get set }
    func updatePokemonDetails(onError: ErrorBlock?)
    func back()
}

class PokemonDetailsViewModelClient: NSObject, PokemonDetailsViewModel {
    
    // MARK: - Public fields
    
    var onUpdateDetails: (() -> ())?
    var coordinator: ListCoordinator!
    var pokemon: Pokemon {
        didSet {
            onUpdateDetails?()
        }
    }

    // MARK: - Private fields
    
    private let api: PokemonsApi
    
    // MARK: - Public methods
    
    init(pokemon: Pokemon, api: PokemonsApi) {
        self.pokemon = pokemon
        self.api = api
        super.init()
    }
    
    func updatePokemonDetails(onError: ErrorBlock?) {
        api.loadPokemonDetails(pokemonId: pokemon.id, onSuccess: { (pokemon) in
            if let poke = pokemon {
                self.pokemon = poke
            } else {
                onError?(nil)
            }
        }, onError: onError)
    }
    
    func back() {
        coordinator.backToList()
    }
    
}
