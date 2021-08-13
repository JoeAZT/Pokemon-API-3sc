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
            .font(.system(size: 18, weight: .regular, design: .default))
            
            Spacer()
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 5)
                    .frame(width: 100, height: 10)
                    .opacity(0.2)
                RoundedRectangle(cornerRadius: 5)
                    .foregroundColor(.black.opacity(0.6))
                    .frame(width: CGFloat(pokemonStat.baseStat) / 2, height: 10)
            }
        }
    }
}
