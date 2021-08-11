//
//  ContentView.swift
//  Pokemon API
//
//  Created by Joseph Taylor on 11/08/2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct PokedexView: View {
    
    @State var pokedex = [Pokemon]()
    @State var baseURL = "https://pokeapi.co/api/v2/pokemon/"
    @State var selectedPokemon: Pokemon?
    @State var searchTerm = ""
    
    var filterPokemon: [Pokemon] {
        if searchTerm.trimmingCharacters(in: .whitespaces) != "" {
            return pokedex.filter({$0.name.lowercased().starts(with: searchTerm.lowercased())}).sorted( by: { $1.id > $0.id })
        } else {
            return pokedex.sorted( by: { $1.id > $0.id })
        }
    }
    
    //Pokedex Networking function
    func loadInitialData() {
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
    
    func loadAllData() {
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
    
    func loadData(for id: Int, completion: @escaping (Pokemon?) -> Void) {
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
    
    //Search Networking function
    func loadSearchData() {
        guard let url = URL(string: "\(baseURL)\(searchTerm.lowercased())/") else {
            print("invalid url")
            return
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                do {
                    let decodedData = try JSONDecoder().decode(Pokemon.self, from: data)
                    selectedPokemon = decodedData
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
    
    var body: some View {
        VStack {
            //Search bar and button
            HStack {
                ZStack(alignment: .leading) {
                    TextViewWrapper(text: $searchTerm)
                        .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray.opacity(0.3))).frame(height: 40)
                        .padding()
                    
                    if searchTerm.isEmpty {
                        Text("Pikachu...")
                            .opacity(0.3)
                            .padding(.leading, 20)
                    }
                }
            }
            .padding(.horizontal, 10)
            
            //Pokedex List
            List(filterPokemon, id: \.id) { pokemon in
                HStack {
                    Text(pokemon.name.capitalized)
                    Spacer()
                    WebImage(url: URL(string:pokemon.sprites.frontDefault))
                    Button(action: {
                        selectedPokemon = pokemon
                    }, label: {
                        Image(systemName: "chevron.right")
                            .font(.system(size: 20, weight: .semibold, design: .default))
                    })
                }
            }.onAppear(perform: {
                loadInitialData()
                loadAllData()
            })
        }
        .sheet(item: $selectedPokemon) { pokemon in
            PokemonDetailView(pokemon: pokemon)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexView()
    }
}
