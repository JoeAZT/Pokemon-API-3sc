//
//  ContentView.swift
//  Pokemon API
//
//  Created by Joseph Taylor on 11/08/2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct PokedexView: View {
    @StateObject var viewModel = PokedexViewModel()
    
    var body: some View {
        VStack {
            //Search bar
            HStack {
                ZStack(alignment: .leading) {
                    TextViewWrapper(text: $viewModel.searchTerm)
                        .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray.opacity(0.3))).frame(height: 40)
                        .padding()
                    
                    if viewModel.searchTerm.isEmpty {
                        Text("Search Pokedex...")
                            .opacity(0.3)
                            .padding(.leading, 20)
                    }
                }
            }
            .padding(.horizontal, 10)
            
            //Pokedex List
            List(viewModel.filterPokemon, id: \.id) { pokemon in
                PokemonRow(pokemon: pokemon) {
                    viewModel.selectedPokemon = pokemon
                }
            }.onAppear(perform: viewModel.loadData)
        }
        .sheet(item: $viewModel.selectedPokemon) { pokemon in
            PokemonDetailView(pokemon: pokemon)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexView()
    }
}
