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
    func descargar_personajes() async {
        guard let pagina_descargada: PaginaResultadoPersonaje = try? await TheOfficeAPI().descargar_pagina_personajes() else {return}
        
        self.pagina_resultados_personaje = pagina_descargada
    }
    
    func descargar_info_personaje(id: String) async {
        guard let oficinista: Oficinista = try? await TheOfficeAPI().descargar_informacion_personaje(id: id) else {return}
        
        self.personaje = oficinista
    }
    
    func descargar_informacion_personaje(id: String) {
        Task.detached(operation: {
            await self.descargar_info_personaje(id: id)
        })
    }
    
    //EPISODIOS
    func descargar_episodios() async {
        guard let pagina_descargada: PaginaResultadoEpisodio = try? await TheOfficeAPI().descargar_pagina_episodios() else {return}
        
        self.pagina_resultados_episodio = pagina_descargada
    }
    
    func descargar_info_episodio(id: String) async {
        guard let episodioNom : Episodio = try? await TheOfficeAPI().descargar_informacion_episodio(id: id) else {return}
        
        self.episodio = episodioNom
    }
    
    func descargar_informacion_episodio(id: String) {
        Task.detached(operation: {
            await self.descargar_info_episodio(id: id)
        })
    }
    
    //TEMPORADAS
    func descargar_temporadas() async {
        guard let pagina_descargada: PaginaResultadoTemporada = try? await TheOfficeAPI().descargar_pagina_temporadas() else {return}
        
        self.pagina_resultados_temporada = pagina_descargada
    }
    
    func descargar_info_temporada(id: String) async {
        guard let temporadaNom: Temporada = try? await TheOfficeAPI().descargar_informacion_temporada(id: id) else {return}
        
        self.temporada = temporadaNom
    }
    
    func descargar_informacion_temporada(id: String){
        Task.detached(operation: {
            await self.descargar_info_temporada(id: id)
        })
    }
    
    
}
