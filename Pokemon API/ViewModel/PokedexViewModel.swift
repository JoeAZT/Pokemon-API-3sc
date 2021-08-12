//
//  PokedexViewModel.swift
//  Pokemon API
//
//  Created by Joseph Taylor on 11/08/2021.
//

import SwiftUI

class PokedexViewModel: ObservableObject {
    let baseURL = "https://pokeapi.co/api/v2/pokemon/"
    
    @Published var pokedex = [Pokemon]()
    @Published var selectedPokemon: Pokemon?
    @Published var searchTerm = ""
    
    var filterPokemon: [Pokemon] {
        if searchTerm.trimmingCharacters(in: .whitespaces) != "" {
            return pokedex.filter({$0.name.lowercased().starts(with: searchTerm.lowercased())}).sorted( by: { $1.id > $0.id })
        } else {
            return pokedex.sorted( by: { $1.id > $0.id })
        }
    }
    
    func loadData() {
        loadInitialData()
        loadAllData()
    }
    
    //Pokedex Networking function
    private func loadInitialData() {
        let dispatchGroup = DispatchGroup()
        
        var pokemonArray = [Pokemon]()
        
        for i in 1...100 {
            dispatchGroup.enter()
            
            loadData(for: i) { pokemon in
                if let pokemon = pokemon {
                    pokemonArray.append(pokemon)
                }
                
                dispatchGroup.leave()
            }
        }
        
        dispatchGroup.notify(queue: .main) {
            self.pokedex = pokemonArray
        }
    }
    
    private func loadAllData() {
        let dispatchGroup = DispatchGroup()
        
        var pokemonArray = [Pokemon]()
        
        for i in 1...1100 {
            dispatchGroup.enter()
            
            loadData(for: i) { pokemon in
                if let pokemon = pokemon {
                    pokemonArray.append(pokemon)
                }
                
                dispatchGroup.leave()
            }
        }
        
        dispatchGroup.notify(queue: .main) {
            self.pokedex = pokemonArray
        }
    }
    
    private func loadData(for id: Int, completion: @escaping (Pokemon?) -> Void) {
        guard let url = URL(string: "\(baseURL)\(id)/") else {
            print("invalid url")
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                do {
                    let decodedData = try JSONDecoder().decode(Pokemon.self, from: data)
                    completion(decodedData)
                } catch {
                    print(error)
                    completion(nil)
                }
            } else {
                completion(nil)
            }
        }.resume()
    }
}
