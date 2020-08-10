//
//  RestApiClient.swift
//  Pokemons
//
//  Created by Georgiy Farafonov on 10.08.2020.
//  Copyright © 2020 Georgiy Farafonov. All rights reserved.
//

import UIKit
import Alamofire

class RestApiClient: NSObject, RestApi {
    
    var headers: [String : String]?
    
    func get(url: URL, parameters: [String : Any]?, onSuccess: SuccessBlock<Any>?, onError: ErrorBlock?) {
        
        Alamofire.request(url,
                          method: .get,
                          parameters: parameters,
                          encoding: URLEncoding.default,
                          headers: headers)
            .responseJSON { [weak self] (response) in
                self?.handleResponse(response, onSuccess: onSuccess, onError: onError)
        }
        
    }
    
    private func handleResponse(_ response: DataResponse<Any>, onSuccess: SuccessBlock<Any>?, onError: ErrorBlock?) {
        switch response.result {
        case .success(let json):
            onSuccess?(json)
        case .failure(let error):
            onError?(error)
        }
    }
    
}
