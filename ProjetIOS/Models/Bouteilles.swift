//
//  Bouteilles.swift
//  ProjetIOS
//
//  Created by Thibaud Morin on 15/01/2021.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let bouteilles = try? newJSONDecoder().decode(Bouteilles.self, from: jsonData)

import Foundation

// MARK: - Bouteilles
class Bouteilles: Codable {
    let result: [Result]

    init(result: [Result]) {
        self.result = result
    }
}

// MARK: - Result
class Result: Codable {
    let id: Int
    let name: String
    let couleur: String
    let degré, année: String
    let pays, region: String

    init(id: Int, name: String, couleur: String, degré: String, année: String, pays: String, region: String) {
        self.id = id
        self.name = name
        self.couleur = couleur
        self.degré = degré
        self.année = année
        self.pays = pays
        self.region = region
    }
}
