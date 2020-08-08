//
//  PokemonsCoordinatorTests.swift
//  PokemonsTests
//
//  Created by Georgiy Farafonov on 08.08.2020.
//  Copyright © 2020 Georgiy Farafonov. All rights reserved.
//

import XCTest

class PokemonsCoordinatorTests: XCTestCase {

    var coordinator: PokemonsCoordinator!
    
    override func setUp() {
        coordinator = PokemonsCoordinator(navigationController: UINavigationController(rootViewController: PokemonsListController()))
    }
    
    func testPokemonsCoordinatorCreation() {
        XCTAssertNotNil(coordinator)
    }
    
    func testCoordinatorShouldAddInitialVCToNavigationStack() {
        XCTAssertFalse(coordinator.navigationController.viewControllers.isEmpty)
    }
    
    func testCoordinatorShouldHavePokemonsListVCAsInitial() {
        let controller = coordinator.initialController as? PokemonsListController
        XCTAssertNotNil(controller)
    }
    
}
