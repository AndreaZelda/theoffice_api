//
//  PantallaTemporadas.swift
//  TheOffice
//
//  Created by alumno on 5/19/25.
//

import Foundation
import SwiftUI

struct Temporadas: View {
    
    @Environment (ControladorAplicacion.self) var controlador
    
    var body: some View {
        if let temporadas = controlador.temporadas {
            NavigationStack {
                ScrollView {
                    LazyVStack {
                        HStack {
                            Text("TEMPORADAS")
                        }
                        ForEach(temporadas) { temporada in
                            NavigationLink {
                                PantallaDetallesTemporada(temporada: temporada)
                            } label: {
                                HStack {
                                    Text("Temporada \(temporada.number)")
                                }
                            }
                            .simultaneousGesture(TapGesture().onEnded {
                                controlador.descargar_informacion_temporada(id: temporada.id)
                            })
                        }
                    }
                }
            }
        } else {
            ProgressView("Cargando temporadas...")
        }
    }

}


#Preview {
    Temporadas()
        .environment(ControladorAplicacion())
}
