//
//  PokemonModel.swift
//  Pokemon API
//
//  Created by Joseph Taylor on 11/08/2021.
//

import Foundation

struct Pokemon: Codable, Identifiable {
    let height: Int
    let id: Int
    let name: String
    let sprites: Sprites
    let species: Species
    let stats: [Stat]
    let types: [TypeElement]
    let weight: Int
}

class Sprites: Codable {
    let frontDefault: String
    let frontFemale: String?

    enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
        case frontFemale = "front_female"
    }

    init(frontDefault: String, frontFemale: String) {
        self.frontDefault = frontDefault
        self.frontFemale = frontFemale
    }
}

struct Species: Codable {
    let name: String
    let url: String
}


struct Stat: Codable {
    let baseStat, effort: Int
    let stat: Species

    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case effort, stat
    }
}


struct TypeElement: Codable {
    let slot: Int
    let type: Species
}
