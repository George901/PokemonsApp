//
//  Type.swift
//  Pokemons
//
//  Created by Georgiy Farafonov on 20.08.2020.
//  Copyright © 2020 Georgiy Farafonov. All rights reserved.
//

import UIKit
import ObjectMapper

class Type: NSObject, Mappable {

    var slot: Int?
    var name: String?
        
    required init?(map: Map) {}
      
    func mapping(map: Map) {
        slot <- map["slot"]
        name <- map["type.name"]
    }
    
    
}
