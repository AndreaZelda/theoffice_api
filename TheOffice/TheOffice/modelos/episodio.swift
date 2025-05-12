//
//  episodio.swift
//  TheOffice
//
//  Created by alumno on 5/12/25.
//

import Foundation

struct Episodio: Identifiable, Codable {
    let id: String
    let title: String
    let episode: String
    let seriesEpisodeNumber: Int
    let airDate: String
    let season: Temporada
    let mainCharacters: Oficinista
    let supportingCharacters: Oficinista
    let recurringCharacters: Oficinista
}
