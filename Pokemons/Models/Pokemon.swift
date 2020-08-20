//
//  Pokemon.swift
//  Pokemons
//
//  Created by Georgiy Farafonov on 10.08.2020.
//  Copyright © 2020 Georgiy Farafonov. All rights reserved.
//

import UIKit
import ObjectMapper

class Pokemon: NSObject, Mappable {
    
    var name: String = ""
    var id: Int = 0
    var baseExperience: Int?
    var height: String?
    var weight: String?
    var abilities: [Ability]?
    var stats: [Stat]?
    
    required init?(map: Map) {}
    
    init(name: String, id: Int) {
        self.name = name
        self.id = id
        super.init()
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        id <- map["id"]
        baseExperience <- map["base_experience"]
        height <- map["height"]
        weight <- map["weight"]
        abilities <- map["abilities"]
        stats <- map["stats"]
    }
    
}
