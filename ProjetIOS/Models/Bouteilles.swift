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
    let name: String
    let couleur: String
    let année: String
    let pays, region: String

    init(name: String, couleur: String, année: String, pays: String, region: String) {
        self.name = name
        self.couleur = couleur
        self.année = année
        self.pays = pays
        self.region = region
    }
    

}
