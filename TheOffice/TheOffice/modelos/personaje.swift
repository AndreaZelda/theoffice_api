//
//  personaje.swift
//  TheOffice
//
//  Created by alumno on 5/12/25.
//

import Foundation

struct Oficinista: Identifiable, Codable{
    let id: Int
    let name: String
    let gender: String?
    let marital: String?
    let job: [String]?
    let workplace: [String]?
    let firstAppearance: String?
    let lastAppearance: String?
    let actor: String?
    let episodes: [Episodio]?
}
