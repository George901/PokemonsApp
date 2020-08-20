//
//  Ability.swift
//  Pokemons
//
//  Created by Georgiy Farafonov on 11.08.2020.
//  Copyright © 2020 Georgiy Farafonov. All rights reserved.
//

import UIKit
import ObjectMapper

class Ability: NSObject, Mappable {

    var name: String?
    var link: String?
    var isHidden: Bool = false
    var slot: Int?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        name <- map["ability.name"]
        link <- map["ability.url"]
        isHidden <- map["is_hidden"]
        slot <- map["slot"]
    }
    
    
}
