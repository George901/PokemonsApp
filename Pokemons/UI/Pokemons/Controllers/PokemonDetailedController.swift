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
    @IBOutlet private weak var typeLabel: UILabel!
    @IBOutlet private weak var heightLabel: UILabel!
    @IBOutlet private weak var weightLabel: UILabel!
    @IBOutlet private weak var idLabel: UILabel!
    @IBOutlet private weak var statsLabel: UILabel!
    @IBOutlet private weak var tableViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet private weak var tableView: UITableView!
    
    deinit {
        removeObservers()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegates()
        setupBindings()
        addObservers()
        setupView()
    }
    
    private func setupDelegates() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func setupBindings() {
        viewModel.onUpdateDetails = { [weak self] in
            self?.setupPokemonData()
        }
    }
    
    private func setupView() {
        statsLabel.text = "Stats"
        setupPokemonData()
        viewModel.updatePokemonDetails { (error) in
            print(error)
        }
    }
    
    private func setupPokemonData() {
        nameLabel.text = viewModel.pokemon.name
        mainImage.image = UIImage(named: "\(viewModel.pokemon.id)")
        weightLabel.text = viewModel.pokemon.weight == nil ? "" : "\(viewModel.pokemon.weight!)"
        heightLabel.text = viewModel.pokemon.height == nil ? "" : "\(viewModel.pokemon.height!)"
        idLabel.text = "\(viewModel.pokemon.id)"
        typeLabel.text = viewModel.pokemon.getType()
        tableView.reloadData()
    }
    
    private func addObservers() {
        tableView.addObserver(self, forKeyPath: #keyPath(UITableView.contentSize), options: .new, context: nil)
    }
    
    private func removeObservers() {
        tableView.removeObserver(self, forKeyPath: #keyPath(UITableView.contentSize))
    }

    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if let tView = object as? UITableView {
            tableViewHeightConstraint.constant = tView.contentSize.height
        }
    }
    
    @IBAction private func backButtonPressed(_ sender: UIButton) {
        viewModel.back()
    }
    
}

extension PokemonDetailedController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.pokemon.stats?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StatCell", for: indexPath) as! StatCell
        cell.setup(stat: viewModel.pokemon.stats![indexPath.row])
        return cell
    }
    
}

extension PokemonDetailedController: UITableViewDelegate {
    
}

