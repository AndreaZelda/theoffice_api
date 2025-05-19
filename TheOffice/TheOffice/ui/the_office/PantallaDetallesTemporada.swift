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
        if(controlador.pagina_resultados_temporada != nil){
            NavigationStack{
                ScrollView{
                    HStack{
                        Text("Temporada \(temporada.number)")
                    }
                    
                    Text("Fecha de inicio: \(temporada.startDate ?? "2005")")
                    Text("Fecha de finalización: \(temporada.endDate ?? "2005")")
                    
                }
            }
        }
    }
}

#Preview {
    PantallaDetallesTemporada(temporada: temporada_falsa)
        .environment(ControladorAplicacion())
}

