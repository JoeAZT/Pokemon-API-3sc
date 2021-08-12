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
            WebImage(url: URL(string: "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/d8bf49eb-f01d-4851-810a-6aa6fc317107/defoec0-d0c0a40d-139d-482a-a043-6da7178296dd.png/v1/fill/w_1600,h_975,strp/pokemon_logo_update_2021_by_obsolete00_defoec0-fullview.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9OTc1IiwicGF0aCI6IlwvZlwvZDhiZjQ5ZWItZjAxZC00ODUxLTgxMGEtNmFhNmZjMzE3MTA3XC9kZWZvZWMwLWQwYzBhNDBkLTEzOWQtNDgyYS1hMDQzLTZkYTcxNzgyOTZkZC5wbmciLCJ3aWR0aCI6Ijw9MTYwMCJ9XV0sImF1ZCI6WyJ1cm46c2VydmljZTppbWFnZS5vcGVyYXRpb25zIl19.q5xiGiCiW5rIaSkzLpngofi4bsdFnlMMGEGIC14R5Ic"))
                .resizable()
                .frame(width: 140, height: 80)
                
            
            //Search bar
            HStack {
                ZStack(alignment: .leading) {
                    TextField("Search Pokedex...", text: $viewModel.searchTerm)
                        .padding(5)
                        .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray.opacity(0.3))).frame(height: 40)
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
