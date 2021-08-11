//
//  ContentView.swift
//  Pokemon API
//
//  Created by Joseph Taylor on 11/08/2021.
//

import SwiftUI

struct PokedexView: View {
    
    @State var pokedex = [Pokemon]()
    @State var baseURL = "https://pokeapi.co/api/v2/pokemon/"
    @State var pokeIndexStart = 1
    @State var pokeIndexEnd = 20
    @State var selectedPokemon: Pokemon?
    @State var showingPokemonView = false
    
    func loadData() {
        pokedex.removeAll()
        for i in pokeIndexStart...pokeIndexEnd {
            guard let url = URL(string: "\(baseURL)\(i)/") else {
                print("invalid url")
                return
            }
            let request = URLRequest(url: url)
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let data = data {
                    do {
                        let decodedData = try JSONDecoder().decode(Pokemon.self, from: data)
                        pokedex.append(decodedData)
                        print(decodedData.name)
                    } catch {
                        print(error)
                    }
                }
            }.resume()
        }
    }
    
    var body: some View {
        VStack {
            List(pokedex.sorted( by: { $1.id > $0.id }), id: \.id) { pokemon in
                VStack(alignment: .leading){
                    Text(pokemon.name)
                    Image(pokemon.sprites.frontDefault)
                    Button(action: {
                        self.showingPokemonView.toggle()
                        selectedPokemon = pokemon
                    }, label: {
                        Image(systemName: "chevron.right")
                            .font(.system(size: 20, weight: .semibold, design: .default))
                    })
                }
            }.onAppear(perform: {loadData()})
            
            HStack {
                Button(action: {
                    pokeIndexStart -= 20
                    pokeIndexEnd -= 20
                    loadData()
                } ,label: {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 30, weight: .semibold, design: .default))
                })
                .padding(20)
                Spacer()
                Button(action: {
                    pokeIndexStart += 20
                    pokeIndexEnd += 20
                    loadData()
                } ,label: {
                    Image(systemName: "chevron.right")
                        .font(.system(size: 30, weight: .semibold, design: .default))
                })
                .sheet(item: $selectedPokemon) { pokemon in
                    PokemonDetailView(pokemon: pokemon)
                }
                .padding(20)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexView()
    }
}
