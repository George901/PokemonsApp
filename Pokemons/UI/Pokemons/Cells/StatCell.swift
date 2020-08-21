//
//  StatCell.swift
//  Pokemons
//
//  Created by Georgiy Farafonov on 21.08.2020.
//  Copyright © 2020 Georgiy Farafonov. All rights reserved.
//

import UIKit

class StatCell: UITableViewCell {
    
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var valueLabel: UILabel!

    func setup(stat: Stat) {
        nameLabel.text = stat.name
        valueLabel.text = "\(stat.baseStat)"
    }

}
