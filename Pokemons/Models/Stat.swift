//
//  Stat.swift
//  Pokemons
//
//  Created by Georgiy Farafonov on 11.08.2020.
//  Copyright © 2020 Georgiy Farafonov. All rights reserved.
//

import UIKit
import ObjectMapper

class Stat: NSObject, Mappable {

    var baseStat: Int = 0
    var effort: Int = 0
    var name: String?
    
    required init?(map: Map) {}
    
    func mapping(map: Map) {
        
        baseStat <- map["base_stat"]
        effort <- map["effort"]
        name <- map["stat.name"]
        
    }
    
}
