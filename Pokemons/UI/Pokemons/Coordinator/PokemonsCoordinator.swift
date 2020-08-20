//
//  PokemonsCoordinator.swift
//  Pokemons
//
//  Created by Georgiy Farafonov on 08.08.2020.
//  Copyright © 2020 Georgiy Farafonov. All rights reserved.
//

import UIKit

final class PokemonsCoordinator: NSObject, Coordinator {
    
    unowned var parentCoordinator: Coordinator?
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        super.init()
    }
    
    func showPokemonDetails(_ pokemon: Pokemon) {
        
        let detailedVC = PokemonDetailedController.instantiateFromStoryboardNamed("Pokemons", storyboardIdentifier: "PokemonsListController", bundle: Bundle.main)
        
        
    }

}
