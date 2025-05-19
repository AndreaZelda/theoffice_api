//
//  controlador_app.swift
//  TheOffice
//
//  Created by alumno on 5/12/25.
//

import Foundation
import SwiftUI

@Observable
@MainActor
public class ControladorAplicacion{
    
    //Seccion Personajes
    var pagina_resultados_personaje: PaginaResultadoPersonaje? = nil
    var personaje: Oficinista? = nil
    var personaje_seleccionado: Oficinista? = nil
    
    //Seccion Episodios
    var pagina_resultados_episodio: PaginaResultadoEpisodio? = nil
    var episodio: Episodio? = nil
    var episodio_seleccionado: Episodio? = nil
    
    //Seccion Temporadas
    var temporadas: [Temporada]? = nil
    var pagina_resultados_temporada: PaginaResultadoTemporada? = nil
    var temporada: Temporada? = nil
    var temporada_seleccionada: Temporada? = nil
    
    init(){
        Task.detached(priority: .high){
            await self.descargar_personajes()
            
            await self.descargar_episodios()
            
            await self.descargar_temporadas()
        }
    }
    
    //PERSONAJES
//    func descargar_personajes() async {
//        print("Intentando descargar personajes...")
//        guard let pagina_descargada: PaginaResultadoPersonaje = try? await TheOfficeAPI().descargar_pagina_personajes() else {return}
//        
//        print("Ayuda en descarga personajes")
//        self.pagina_resultados_personaje = pagina_descargada
//    }
    func descargar_personajes() async {
        var personajesTotales: [Oficinista] = []
        var paginaActual = 1
        var seguir = true

        while seguir {
            let recurso = "/characters?page=\(paginaActual)"
            print("Descargando página \(paginaActual)...")

            guard let pagina: PaginaResultadoPersonaje = try? await TheOfficeAPI().descargar(recurso: recurso) else {
                print("Falló la descarga de la página \(paginaActual)")
                break
            }

            personajesTotales.append(contentsOf: pagina.results)

            if pagina.meta.isLastPage {
                seguir = false
            } else {
                paginaActual += 1
            }
        }

        print("TOTAL PERSONAJES DESCARGADOS: \(personajesTotales.count)")

        self.pagina_resultados_personaje = PaginaResultadoPersonaje(
            results: personajesTotales,
            meta: Meta(
                isFirstPage: true,
                isLastPage: true,
                currentPage: 1,
                previousPage: nil,
                nextPage: nil,
                pageCount: 1
            )
        )
    }

    
    func descargar_info_personaje(id: Int) async {
        guard let oficinista: Oficinista = try? await TheOfficeAPI().descargar_informacion_personaje(id: id) else {return}
        
        self.personaje = oficinista
    }
    
    func descargar_informacion_personaje(id: Int) {
        Task.detached(operation: {
            await self.descargar_info_personaje(id: id)
        })
    }
    
    //EPISODIOS
    func descargar_episodios() async {
        guard let pagina_descargada: PaginaResultadoEpisodio = try? await TheOfficeAPI().descargar_pagina_episodios() else {return}
        
        self.pagina_resultados_episodio = pagina_descargada
    }
    
    func descargar_info_episodio(id: Int) async {
        guard let episodioNom : Episodio = try? await TheOfficeAPI().descargar_informacion_episodio(id: id) else {return}
        
        self.episodio = episodioNom
    }
    
    func descargar_informacion_episodio(id: Int) {
        Task.detached(operation: {
            await self.descargar_info_episodio(id: id)
        })
    }
    
    //TEMPORADAS
    func descargar_temporadas() async {
        guard let temporadasDescargadas: [Temporada] = try? await TheOfficeAPI().descargar_pagina_temporadas() else { return }

        self.temporadas = temporadasDescargadas
    }

//    func descargar_temporadas() async {
//        guard let pagina_descargada: [Temporada] = try? await TheOfficeAPI().descargar_pagina_temporadas() else {return}
//        
//        self.pagina_resultados_temporada = PaginaResultadoTemporada(results: pagina_descargada, meta: Meta)
//    }
    
    func descargar_info_temporada(id: Int) async {
        guard let temporadaNom: Temporada = try? await TheOfficeAPI().descargar_informacion_temporada(id: id) else {return}
        
        self.temporada = temporadaNom
    }
    
    func descargar_informacion_temporada(id: Int){
        Task.detached(operation: {
            await self.descargar_info_temporada(id: id)
        })
    }
    
    
}
