//
//  PantallaDetallesEpisodio.swift
//  TheOffice
//
//  Created by alumno on 5/19/25.
//

import Foundation
import SwiftUI

let episodio_falso = Episodio(id: 1, title: "Piloto", episode: "1", seriesEpisodeNumber: 1, airDate: "2005", season: nil)

struct PantallaDetallesEpisodio: View {
    let episodio: Episodio
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View {
        if(controlador.pagina_resultados_episodio != nil){
            NavigationStack{
                ScrollView{
                    HStack{
                        Text("\(episodio.title ?? "Nombrecito")")
                    }
                    
                    Text("Episodio: \(episodio.episode ?? "Episiodito")")
                    Text("Número de episodio en la serie: \(episodio.seriesEpisodeNumber ?? 1)")
                    
                    Text("\(episodio.airDate ?? "Añito")")
                }
            }
        }
    }
}

#Preview {
    PantallaDetallesEpisodio(episodio: episodio_falso)
        .environment(ControladorAplicacion())
}
