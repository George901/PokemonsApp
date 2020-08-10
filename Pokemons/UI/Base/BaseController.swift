//
//  BaseController.swift
//  Pokemons
//
//  Created by Georgiy Farafonov on 10.08.2020.
//  Copyright © 2020 Georgiy Farafonov. All rights reserved.
//

import UIKit

class BaseController: UIViewController {

    @IBOutlet private weak var headerHeightConstraint: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        setupHeader()
    }
    
    private func setupHeader() {
        guard let heightConstraint = headerHeightConstraint else { return }
        let height = heightConstraint.constant
        heightConstraint.constant = UIScreen.main.bounds.height >= 812 ? height + view.safeAreaInsets.top : height
    }

}
