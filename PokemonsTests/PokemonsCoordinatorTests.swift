//
//  PokemonsCoordinatorTests.swift
//  PokemonsTests
//
//  Created by Georgiy Farafonov on 08.08.2020.
//  Copyright © 2020 Georgiy Farafonov. All rights reserved.
//

import XCTest
@testable import Pokemons


class PokemonsCoordinatorTests: XCTestCase {

    var coordinator: ListCoordinator!
    
    override func setUp() {
        coordinator = ListCoordinator(navigationController: UINavigationController())
        coordinator.startFlow(with: PokemonsListController())
    }
    
    func testPokemonsCoordinatorCreation() {
        XCTAssertNotNil(coordinator)
    }
    
    func testCoordinatorShouldAddInitialVCToNavigationStack() {
        XCTAssertFalse(coordinator.navigationController.viewControllers.isEmpty)
    }
    
    func testCoordinatorShouldHavePokemonsListVCAsInitial() {
        let controller = coordinator.navigationController.viewControllers[0] as? PokemonsListController
        XCTAssertNotNil(controller)
    }
    
}
