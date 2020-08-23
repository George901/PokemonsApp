//
//  AppDelegate.swift
//  Pokemons
//
//  Created by Georgiy Farafonov on 08.08.2020.
//  Copyright © 2020 Georgiy Farafonov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        startMainFlow()
        return true
    }

    private func startMainFlow() {
        window = UIWindow()
        let navigationController: UINavigationController = UINavigationController()
        let coordinator: ListCoordinator = ListCoordinator(navigationController: navigationController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        coordinator.startFlow(with: PokemonsListController.instantiateFromStoryboardNamed("Pokemons", storyboardIdentifier: "PokemonsListController", bundle: Bundle.main)
)
        
    }

}

