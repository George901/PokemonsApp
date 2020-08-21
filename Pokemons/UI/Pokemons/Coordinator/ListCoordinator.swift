//
//  PokemonsCoordinator.swift
//  Pokemons
//
//  Created by Georgiy Farafonov on 08.08.2020.
//  Copyright © 2020 Georgiy Farafonov. All rights reserved.
//

import UIKit

final class ListCoordinator: NSObject, Coordinator {
        
    // MARK: - Public fields
    
    weak var parentCoordinator: Coordinator?
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    
    // MARK: - Public methods
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        super.init()
    }
    
    func showPokemonDetails(_ pokemon: Pokemon) {
        let detailedVC = PokemonDetailedController.instantiateFromStoryboardNamed("Pokemons", storyboardIdentifier: "PokemonDetailedController", bundle: Bundle.main)
        let viewModel = PokemonDetailedViewModel(pokemon: pokemon,
                                                 api: PokemonsApiClient(apiClient: RestApiClient()))
        viewModel.coordinator = self
        detailedVC.viewModel = viewModel
        navigationController.pushViewController(detailedVC, animated: true)
    }
    
    func backToList() {
        navigationController.popToRootViewController(animated: true)
    }

}
