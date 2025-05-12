//
//  theoffice_API.swift
//  TheOffice
//
//  Created by alumno on 5/12/25.
//

import Foundation
import SwiftUI

class TheOfficeAPI: Codable{
    let url_base = "https://theofficeapi.dev/api"
    
    //PERSONAJES
    func descargar_pagina_personajes() async -> PaginaResultadoPersonaje? {
        let ubicacion_recurso = "/characters"
        
        return await descargar(recurso: ubicacion_recurso)
    }
    
    func descargar_informacion_personaje(id: String) async -> Oficinista? {
        let ubicacion_recurso = "/characters/\(id)"
        
        return await descargar(recurso: ubicacion_recurso)
    }
    
    //EPISODIOS
    func descargar_pagina_episodios() async -> PaginaResultadoEpisodio? {
        let ubicacion_recurso = "/episodes"
        
        return await descargar(recurso: ubicacion_recurso)
    }
    
    func descargar_informacion_episodio(id: String) async -> Episodio? {
        let ubicacion_recurso = "/episodes/\(id)"
        
        return await descargar(recurso: ubicacion_recurso)
    }
    
    //TEMPORADAS
    func descargar_pagina_temporadas() async -> PaginaResultadoTemporada? {
        let ubicacion_recurso = "/seasons"
        
        return await descargar(recurso: ubicacion_recurso)
    }
    
    func descargar_informacion_temporada(id: String) async -> Temporada? {
        let ubicacion_recurso = "/seasons/\(id)"
        
        return await descargar(recurso: ubicacion_recurso)
    }
    
    private func descargar<TipoGenerico: Codable>(recurso: String) async -> TipoGenerico? {
        do {
            guard let url = URL(string: "\(url_base)\(recurso)") else { throw ErroresDeRed.badUrl }
            let (datos, respuesta) = try await URLSession.shared.data(from: url)
            guard let respuesta = respuesta as? HTTPURLResponse else { throw ErroresDeRed.badResponse }
            guard respuesta.statusCode >= 200 && respuesta.statusCode < 300 else { throw ErroresDeRed.badStatus }
            do {
                let respuesta_decodificada = try JSONDecoder().decode(TipoGenerico.self, from: datos)
                return respuesta_decodificada
            }
            catch let error as NSError{
                print("EL ERROR EN TU MODELO ES: \(error.debugDescription)")
                throw ErroresDeRed.fallaAlConvertirLaRespuesta
            }
        }
        
        catch ErroresDeRed.badUrl {
            print("Tienes mal todo adio")
        }
        
        catch ErroresDeRed.badResponse {
            print("Algo salio mal con la respuesta")
        }
        
        catch ErroresDeRed.badStatus {
            print("Como consigues un status negativo de algo que no se mueve jeje")
        }
        
        catch ErroresDeRed.fallaAlConvertirLaRespuesta {
            print("Tienes mal el modelo o la implementacion de este mismo, en dragon ball api")
        }
        
        catch ErroresDeRed.invalidRequest {
            print("Como llegaste aqui")
        }
        
        catch {
            print("Algo salio mal, no deberias ver esto")
        }
        
        return nil
        
    }

    
}

