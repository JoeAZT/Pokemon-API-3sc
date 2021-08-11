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

struct StatNames: Codable {
    let name: String?
}

struct TypeName: Codable {
    let name: PokemonType?
}

struct Stat: Codable {
    let baseStat: Int
    let stat: StatNames

    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case stat
    }
}

struct TypeElement: Codable {
    let slot: Int
    let type: TypeName
}
