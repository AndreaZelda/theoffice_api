//
//  pagina_resultados.swift
//  TheOffice
//
//  Created by alumno on 5/12/25.
//

import Foundation

struct Meta: Codable{
    let isFirstPage: Bool
    let isLastPage: Bool
    let currentPage: Int
    let previousPage: Int
    let nextPage: Int
    let pageCount: Int
}

struct PaginaResultadoPersonaje: Codable{
    let results: [Oficinista]
    let meta: Meta
}

struct PaginaResultadoTemporada: Codable{
    let results: [Temporada]
    let meta: Meta
}

struct PaginaResultadoEpisodio: Codable{
    let results: [Episodio]
    let meta: Meta
}


