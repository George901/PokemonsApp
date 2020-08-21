//
//  PokemonsListViewModel.swift
//  Pokemons
//
//  Created by Georgiy Farafonov on 20.08.2020.
//  Copyright © 2020 Georgiy Farafonov. All rights reserved.
//

import UIKit

protocol PokemonsViewModel {
    var onSearchChange: (([Pokemon]) -> ())? { get set }
    init(storage: Storage, coordinator: PokemonsCoordinator)
    func searchForPokemonByName(_ name: String)
    func showPokemonInfo(_ pokemon: Pokemon)
}

class PokemonsListViewModel: NSObject, PokemonsViewModel {
    
    private var allPokemons: [Pokemon] = []
    private let coordinator: PokemonsCoordinator
    private let storage: Storage
    
    private var searchedPokemons: [Pokemon] = [] {
        didSet {
            onSearchChange?(searchedPokemons)
        }
    }
    
    var onSearchChange: (([Pokemon]) -> ())? {
        didSet {
            onSearchChange?(searchedPokemons)
        }
    }
    
    required init(storage: Storage,
                  coordinator: PokemonsCoordinator) {
        self.storage = storage
        self.coordinator = coordinator
        super.init()
        loadPokemons()
      }
    
    func showPokemonInfo(_ pokemon: Pokemon) {
        coordinator.showPokemonDetails(pokemon)
    }

    func searchForPokemonByName(_ name: String) {
        searchedPokemons = name.isEmpty ? allPokemons : allPokemons.filter({$0.name.lowercased().contains(name.lowercased())})
    }
    
    private func loadPokemons() {
        allPokemons = storage.loadItems()
        searchedPokemons = allPokemons
    }
    
}
