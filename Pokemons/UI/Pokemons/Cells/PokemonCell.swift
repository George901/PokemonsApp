//
//  PokemonCell.swift
//  Pokemons
//
//  Created by Georgiy Farafonov on 20.08.2020.
//  Copyright © 2020 Georgiy Farafonov. All rights reserved.
//

import UIKit

class PokemonCell: UICollectionViewCell {
    
    @IBOutlet private weak var pokemonImage: UIImageView!
    @IBOutlet private weak var nameLbl: UILabel!
    
    private var pokemon: Pokemon!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 5.0
    }
    
    func setupWith(_ pokemon: Pokemon) {
        self.pokemon = pokemon
        nameLbl.text = self.pokemon.name.capitalized
        pokemonImage.image = UIImage(named: "\(pokemon.id ?? 0)")
    }
    
}
