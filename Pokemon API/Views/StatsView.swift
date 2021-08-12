//
//  StatsView.swift
//  Pokemon API
//
//  Created by Joseph Taylor on 12/08/2021.
//

import SwiftUI
struct StatsView: View {
    
    let pokemonStat: Stat
    
    var body: some View {
        HStack {
            VStack {
                Text("\(pokemonStat.stat.name?.capitalized ?? "no value"): \(pokemonStat.baseStat)")
            }
            Spacer()
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .frame(height: 10)
                }
            }
        }
    }
}
