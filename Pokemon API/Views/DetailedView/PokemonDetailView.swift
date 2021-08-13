//
//  PokemonDetailView.swift
//  Pokemon API
//
//  Created by Joseph Taylor on 11/08/2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct PokemonDetailView: View {
    
    let pokemon: Pokemon
    
    var body: some View {
        //Name and ID
            HStack {
                Text("\(pokemon.name.capitalized)")
                    .bold()
                Spacer()
                Text("ID: \(pokemon.id)")
            }
            .font(.title)
            .padding()
        //Image
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(colorType(pokemonType: pokemon.types[0].type.name!)).opacity(0.7)
                    .padding(.horizontal, 20)
                WebImage(url: URL(string:pokemon.sprites.frontDefault))
                    .resizable()
                    .frame(width: 200, height: 200)
            }
            
        //Types
            HStack {
                Spacer()
                Text("Types: ")
                Text(String("\(pokemon.types[0].type.name!.rawValue.capitalized)"))
                    .foregroundColor(.white)
                    .padding(.horizontal, 5)
                    .background(colorType(pokemonType: pokemon.types[0].type.name!))
                    .cornerRadius(4)
                if pokemon.types.count > 1 {
                    Text(String("\(pokemon.types[1].type.name!.rawValue.capitalized)"))
                        .foregroundColor(.white)
                        .padding(.horizontal, 5)
                        .background(colorType(pokemonType: pokemon.types[1].type.name!))
                        .cornerRadius(4)
                }
                Spacer()
            }
            .font(.title2)
            .padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(10)
            .padding(.horizontal)

        //Non-combat stats
            NonCombatStats(pokemon: pokemon)
        
        //Battle stats
            HStack{
                Spacer()
                VStack(alignment: .leading) {
                    StatsView(pokemonStat: pokemon.stats[0])
                    StatsView(pokemonStat: pokemon.stats[1])
                    StatsView(pokemonStat: pokemon.stats[2])
                    StatsView(pokemonStat: pokemon.stats[3])
                    StatsView(pokemonStat: pokemon.stats[4])
                    StatsView(pokemonStat: pokemon.stats[5])
                }
                Spacer()
            }
            .padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(10)
            .padding(.horizontal)
    }
}
