//
//  temporada.swift
//  TheOffice
//
//  Created by alumno on 5/12/25.
//

import Foundation

struct Temporada: Identifiable, Codable{
    let id: Int
    let number: Int
    let startDate: String?
    let endDate: String?
}
