//
//  PokemonDetailView.swift
//  Pokemon API
//
//  Created by Joseph Taylor on 11/08/2021.
//

import SwiftUI

struct PokemonDetailView: View {
    
    let pokemon: Pokemon
    
    var body: some View {
        HStack {
        Text("\(pokemon.name.capitalized)")
            .bold()
            Spacer()
        Text("ID: \(pokemon.id)")
        }
        .padding()
        
        RoundedRectangle(cornerRadius: 5)
            .foregroundColor(.gray)
            .padding(.horizontal)
        
        HStack {
            Text("Types: ")
            Text(String("\(pokemon.types[0].type.name!.capitalized)"))
            if pokemon.types.count > 1 {
                Text(String("\(pokemon.types[1].type.name!.capitalized)"))
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
