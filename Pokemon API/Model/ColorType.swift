//
//  ColorType.swift
//  Pokemon API
//
//  Created by Joseph Taylor on 11/08/2021.
//

import Foundation
import SwiftUI

enum PokemonType: String, Codable {
    case normal
    case fire
    case water
    case grass
    case electric
    case ice
    case fighting
    case poison
    case ground
    case flying
    case psychic
    case bug
    case rock
    case ghost
    case dark
    case dragon
    case steel
    case fairy
}

func colorType(pokemonType: PokemonType) -> Color {
    var color: Color
    switch pokemonType {
    case .normal:
        color = .gray
    case .fire:
        color = .orange
    case .water:
        color = .blue
    case .grass:
        color = .green
    case .electric:
        color = .yellow
    case .ice:
        color = .blue
    case .fighting:
        color = .red
    case .poison:
        color = .purple
    case .ground:
        color = .gray
    case .flying:
        color = .blue
    case .psychic:
        color = .purple
    case .bug:
        color = .green
    case .rock:
        color = .orange
    case .ghost:
        color = .black
    case .dragon:
        color = .purple
    case .steel:
        color = .gray
    case .fairy:
        color = .pink
    default:
        color = .black
    }
    return color
}
