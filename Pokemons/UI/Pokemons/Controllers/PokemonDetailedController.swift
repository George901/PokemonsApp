//
//  PokemonDetailedController.swift
//  Pokemons
//
//  Created by Georgiy Farafonov on 10.08.2020.
//  Copyright © 2020 Georgiy Farafonov. All rights reserved.
//

import UIKit

class PokemonDetailedController: BaseController, CreateFromStoryboard {
    
    var viewModel: PokemonDetailsViewModel!
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var mainImage: UIImageView!
    @IBOutlet private weak var descriptionLbl: UILabel!
    @IBOutlet private weak var typeLbl: UILabel!
    @IBOutlet private weak var defenceLbl: UILabel!
    @IBOutlet private weak var heightLbl: UILabel!
    @IBOutlet private weak var weightLbl: UILabel!
    @IBOutlet private weak var idLbl: UILabel!
    @IBOutlet private weak var baseAttackLbl: UILabel!
    @IBOutlet private weak var currentEvoImg: UIImageView!
    @IBOutlet private weak var nextEvoImg: UIImageView!
    @IBOutlet private weak var evoLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
        
        
    }
    
    private func setupBindings() {
        viewModel.onUpdateDetails = { [weak self] in
            self?.setupPokemonData()
        }
    }
    
    private func setupPokemonData() {
        nameLabel.text = viewModel.pokemon.name
        mainImage.image = UIImage(named: "\(viewModel.pokemon.id)")
        weightLbl.text = viewModel.pokemon.weight
        heightLbl.text = viewModel.pokemon.height ?? "-"
        idLbl.text = "\(viewModel.pokemon.id)"
        
    }

}
