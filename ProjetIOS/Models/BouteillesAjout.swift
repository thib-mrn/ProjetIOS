//
//  BouteillesAjout.swift
//  ProjetIOS
//
//  Created by Thibaud Morin on 26/01/2021.
//

import Foundation

class BouteillesAjout {
    static let shared = BouteillesAjout()
    private init() {}
    
    private(set) var bottle: [Result] = []
    
    func add(bouteille: Result) {
        bottle.append(bouteille)
    }
}
