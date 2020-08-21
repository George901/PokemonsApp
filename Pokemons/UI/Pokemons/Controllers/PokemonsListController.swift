//
//  PokemonsListController.swift
//  Pokemons
//
//  Created by Georgiy Farafonov on 08.08.2020.
//  Copyright © 2020 Georgiy Farafonov. All rights reserved.
//

import UIKit

class PokemonsListController: BaseController, CreateFromStoryboard {

    // MARK: - Public fields
    
    var viewModel: PokemonsViewModel!
    
    // MARK: - Outlets
    
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var searchBar: UISearchBar!
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegates()
        setupBindings()
    }
    
    // MARK: Private methods
    
    private func setupDelegates() {
        collectionView.dataSource = self
        collectionView.delegate = self
        searchBar.delegate = self
    }
    
    private func setupBindings() {
        viewModel.onSearchChange = { [weak self] (pokemons) in
            self?.collectionView.reloadData()
        }
    }
    
}

// MARK: - UICollectionViewDataSource

extension PokemonsListController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.pokemons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokemonCell", for: indexPath) as! PokemonCell
        cell.setupWith(viewModel.pokemons[indexPath.item])
        return cell
    }
    
}

// MARK: - UICollectionViewDelegate

extension PokemonsListController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.showPokemonInfo(viewModel.pokemons[indexPath.item])
    }
    
}

// MARK: - UICollectionViewDelegateFlowLayout

extension PokemonsListController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 105, height: 105)
    }
    
}

// MARK: - UISearchBarDelegate

extension PokemonsListController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.searchForPokemonByName(searchText)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
    
}
