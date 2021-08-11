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
        HStack {
        Text("\(pokemon.name.capitalized)")
            .font(.title)
            .bold()
            Spacer()
        Text("ID: \(pokemon.id)")
            .font(.title)
        }
        .padding()
        
        WebImage(url: URL(string:pokemon.sprites.frontDefault))
            .resizable()
            .frame(width: 200, height: 200)
        HStack {
            Text("Types: ")
            Text(String("\(pokemon.types[0].type.name!.rawValue.capitalized)"))
                .foregroundColor(colorType(pokemonType: pokemon.types[0].type.name!))
            if pokemon.types.count > 1 {
                Text(String("\(pokemon.types[1].type.name!.rawValue.capitalized)"))
                    .foregroundColor(colorType(pokemonType: pokemon.types[1].type.name!))

            }
        }
        
        HStack {
            Text("Height: \(pokemon.height)")
            Text("Weight: \(pokemon.weight)")
        }
        
        HStack{
            VStack(alignment: .leading) {
                Text(String("HP: \(pokemon.stats[0].baseStat)"))
                Text(String("Attack: \(pokemon.stats[1].baseStat)"))
                Text(String("Defence: \(pokemon.stats[2].baseStat)"))
            }
            .padding(.horizontal, 10)
            VStack(alignment: .leading) {
                Text(String("Speed: \(pokemon.stats[5].baseStat)"))
                Text(String("Sp.Atk: \(pokemon.stats[3].baseStat)"))
                Text(String("Sp.Def: \(pokemon.stats[4].baseStat)"))
            }
            .padding(.horizontal, 10)
        }
        .padding()
        .background(Color.gray.opacity(0.2))
    }
    
}
