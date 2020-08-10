//
//  RestApi.swift
//  Pokemons
//
//  Created by Georgiy Farafonov on 10.08.2020.
//  Copyright © 2020 Georgiy Farafonov. All rights reserved.
//

import Foundation

protocol RestApi: NSObjectProtocol {
    var headers: [String : String]? { get set }
    func get(url: URL, parameters: [String : Any]?, onSuccess: SuccessBlock<Any>?, onError: ErrorBlock?)
}
