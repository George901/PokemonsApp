//
//  PokemonsListViewModel.swift
//  Pokemons
//
//  Created by Georgiy Farafonov on 20.08.2020.
//  Copyright © 2020 Georgiy Farafonov. All rights reserved.
//

import UIKit

protocol PokemonsViewModel {
    
    var pokemons: [Pokemon] { get set }
    var onSearchChange: (([Pokemon]) -> ())? { get set }
    init(storage: Storage, coordinator: ListCoordinator)
    func searchForPokemonByName(_ name: String)
    func showPokemonInfo(_ pokemon: Pokemon)
    
}

class PokemonsListViewModel: NSObject, PokemonsViewModel {
    
    // MARK: - Public fields
    
    var pokemons: [Pokemon] = [] {
        didSet {
            onSearchChange?(pokemons)
        }
    }
    
    var onSearchChange: (([Pokemon]) -> ())? {
        didSet {
            onSearchChange?(pokemons)
        }
    }
    
    // MARK: - Private fields
    
    private var allPokemons: [Pokemon] = []
    private let coordinator: ListCoordinator
    private let storage: Storage
    
    // MARK: - Public methods
    
    required init(storage: Storage,
                  coordinator: ListCoordinator) {
        self.storage = storage
        self.coordinator = coordinator
        super.init()
        loadPokemons()
      }
    
    func showPokemonInfo(_ pokemon: Pokemon) {
        coordinator.showPokemonDetails(pokemon)
    }

    func searchForPokemonByName(_ name: String) {
        pokemons = name.isEmpty ? allPokemons : allPokemons.filter({$0.name.lowercased().contains(name.lowercased())})
    }
    
    // MARK: - Public methods
    
    private func loadPokemons() {
        allPokemons = storage.loadItems()
        pokemons = allPokemons
    }
    
}
