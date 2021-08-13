//
//  File.swift
//  Pokemon API
//
//  Created by Joseph Taylor on 13/08/2021.
//

import SwiftUI

struct NonCombatStats: View {
    
    let pokemon: Pokemon
    
    var body: some View {
        HStack {
            Spacer()
            VStack {
                Text("Height:")
                    .font(.system(size: 12))
                    .opacity(0.6)
                HStack {
                    Text(String(format: "%.1f", (Double(pokemon.height) / 10)))
                    Text("m")
                }
                .font(.system(size: 25, weight: .semibold, design: .default))
            }
            Spacer()
            VStack {
                Text("Weight:")
                    .font(.system(size: 12))
                    .opacity(0.6)
                Text("\(pokemon.weight) Kg")
                    .font(.system(size: 25, weight: .semibold, design: .default))
            }
            Spacer()
        }
        .font(.title2)
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
        .padding(.horizontal)
    }
}
