//
//  CreateFromStoryboard.swift
//  Pokemons
//
//  Created by Georgiy Farafonov on 08.08.2020.
//  Copyright © 2020 Georgiy Farafonov. All rights reserved.
//

import UIKit

protocol CreateFromStoryboard: NSObjectProtocol {
    static func instantiateFromStoryboardNamed(_ name: String, storyboardIdentifier: String, bundle: Bundle?) -> Self
}

extension CreateFromStoryboard where Self: UIViewController {
    
    static func instantiateFromStoryboardNamed(_ name: String, storyboardIdentifier: String, bundle: Bundle?) -> Self {
        let storyboard = UIStoryboard(name: name, bundle: bundle)
        return storyboard.instantiateViewController(identifier: storyboardIdentifier)
        
    }
    
}
