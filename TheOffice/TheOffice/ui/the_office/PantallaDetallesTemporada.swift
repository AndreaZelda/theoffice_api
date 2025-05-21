//
//  PantallaDetallesTemporada.swift
//  TheOffice
//
//  Created by alumno on 5/19/25.
//

import Foundation
import SwiftUI

let temporada_falsa = Temporada(id: 1, number: 1, startDate: "2005", endDate: "2005")

struct PantallaDetallesTemporada: View {
    let temporada: Temporada
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View {
        if let temporadas = controlador.temporadas {
            NavigationStack {
                ScrollView {
                    LazyVStack {
                        VStack {
                            Text("TEMPORADA \(temporada.number)")
                            Image(imagenes_temporadas[temporada.id] ?? "0")
                            Text("Fecha de emisión: \(temporada.startDate ?? "unknown")")
                            Text("Fecha de finalización: \(temporada.endDate ?? "unknown")")
                        }
                    }
                }
            }
        } else {
            ProgressView("Cargando temporada...")
        }
    }
}

#Preview {
    PantallaDetallesTemporada(temporada: temporada_falsa)
        .environment(ControladorAplicacion())
}

