//
//  PokemonsListController.swift
//  Pokemons
//
//  Created by Georgiy Farafonov on 08.08.2020.
//  Copyright © 2020 Georgiy Farafonov. All rights reserved.
//

import UIKit

class PokemonsListController: BaseController, CreateFromStoryboard {

    var viewModel: PokemonsViewModel!
    
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var searchBar: UISearchBar!
    
    private var pokemons: [Pokemon] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegates()
        setupBindings()
    }
    
    private func setupDelegates() {
        collectionView.dataSource = self
        collectionView.delegate = self
        searchBar.delegate = self
    }
    
    private func setupBindings() {
        viewModel.onSearchChange = { [weak self] (pokemons) in
            self?.pokemons = pokemons
            self?.collectionView.reloadData()
        }
    }
    
}

extension PokemonsListController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokemons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokemonCell", for: indexPath) as! PokemonCell
        cell.setupWith(pokemons[indexPath.item])
        return cell
    }
    
}

extension PokemonsListController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.showPokemonInfo(pokemons[indexPath.item])
    }
    
}

extension PokemonsListController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 105, height: 105)
    }
    
}

extension PokemonsListController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.searchForPokemonByName(searchText)
    }
    
}
