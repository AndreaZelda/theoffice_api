//
//  episodio.swift
//  TheOffice
//
//  Created by alumno on 5/12/25.
//

import Foundation

struct Episodio: Identifiable, Codable {
    let id: Int
    let title: String
    let episode: String
    let seriesEpisodeNumber: Int?
    let airDate: String?
    let season: SeasonResumen?
}

struct SeasonResumen: Codable {
    let id: Int
    let number: Int
}
