//
//  PokemonDetailView.swift
//  Pokemon API
//
//  Created by Joseph Taylor on 11/08/2021.
//

import SwiftUI

struct PokemonView: View {
    
    let pokemon: Pokemon
    
    var body: some View {
        Text("\(pokemon.name)")
        Text("\(pokemon.id)")
        Text("\(pokemon.height)")
        Text("\(pokemon.weight)")
    }
    
}
