//
//  PantallaEpisodios.swift
//  TheOffice
//
//  Created by alumno on 5/19/25.
//

import Foundation
import SwiftUI

struct Episodios: View {
    
    @Environment (ControladorAplicacion.self) var controlador
    
    var body: some View {
        if(controlador.pagina_resultados_episodio != nil){
            NavigationStack{
                ScrollView{
                    LazyVStack{
                        HStack{
                            Text("EPISODIOS")
                        }
                        ForEach(controlador.pagina_resultados_episodio!.results){ episodio in
                            NavigationLink {
                                PantallaDetallesEpisodio(episodio: episodio)
                            } label: {
                                HStack {
                                    Image(imagenes_episodios[episodio.id] ?? "default")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 150, height: 250)
                                        .frame(maxWidth: .infinity)
                                    Text("\(episodio.title)")
                                }
                            }
                            .simultaneousGesture(TapGesture().onEnded({
                                controlador.descargar_informacion_episodio(id: episodio.id)
                            }))
                        }
                    }
                }
            }
        }
        else {
            ProgressView("Cargando episodios...")
        }
    }
}


#Preview {
    Episodios()
        .environment(ControladorAplicacion())
}

