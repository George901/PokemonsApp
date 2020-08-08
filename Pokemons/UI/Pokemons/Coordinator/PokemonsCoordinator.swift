//
//  PokemonsCoordinator.swift
//  Pokemons
//
//  Created by Georgiy Farafonov on 08.08.2020.
//  Copyright © 2020 Georgiy Farafonov. All rights reserved.
//

import UIKit

final class PokemonsCoordinator: NSObject, Coordinator {
    
    var navigationController: UINavigationController
    var parentCoordinator: Coordinator?
    var childCoordinators: [Coordinator] = []
    unowned var initialController: UIViewController
    
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        initialController = navigationController.viewControllers[0]
        super.init()
    }

}
