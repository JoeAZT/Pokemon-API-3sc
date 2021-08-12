//
//  PokemonRow.swift
//  Pokemon API
//
//  Created by Joseph Taylor on 11/08/2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct PokemonRow: View {
    
    let pokemon: Pokemon
    let onTap: () -> Void
    
    var body: some View {
        
        HStack {
            Text(pokemon.name.capitalized)
            Spacer()
            WebImage(url: URL(string:pokemon.sprites.frontDefault))
            Button(action: {
                onTap()
            }, label: {
                Image(systemName: "chevron.right")
                    .font(.system(size: 20, weight: .semibold, design: .default))
            })
        }
    }
    
}


