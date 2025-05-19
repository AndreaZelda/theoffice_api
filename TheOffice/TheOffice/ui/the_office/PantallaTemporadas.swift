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
        if(controlador.pagina_resultados_temporada != nil){
            NavigationStack{
                ScrollView{
                    LazyVStack{
                        HStack{
                            Text("TEMPORADAS")
                        }
                        ForEach(controlador.pagina_resultados_temporada!.results){ temporada in
                            NavigationLink {
                                PantallaDetallesTemporada(temporada: temporada)
                            } label: {
                                HStack {
                                    Text("Temporada \(temporada.number)")
                                }
                            }
                            .simultaneousGesture(TapGesture().onEnded({
                                controlador.descargar_informacion_temporada(id: temporada.id)
                            }))
                        }
                    }
                }
            }
        }
        else {
            ProgressView("Cargando temporadas...")
        }
    }
}


#Preview {
    Temporadas()
        .environment(ControladorAplicacion())
}
