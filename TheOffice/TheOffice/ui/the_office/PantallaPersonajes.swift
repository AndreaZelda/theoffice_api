//
//  PantallaPersonajes.swift
//  TheOffice
//
//  Created by alumno on 5/12/25.
//

import Foundation
import SwiftUI

struct Personajes: View {
    @Environment (ControladorAplicacion.self) var controlador
    
    var body: some View {
        if(controlador.pagina_resultados_personaje != nil){
            NavigationStack{
                ScrollView{
                    LazyVStack{
                        HStack{
                            Text("PERSONAJES")
                        }
                        ForEach(controlador.pagina_resultados_personaje!.results){ personaje in
                            NavigationLink {
                                PantallaDetallesPersonaje()
                            } label: {
                                HStack {
                                    Text("\(personaje.name)")
                                }
                            }
                            .simultaneousGesture(TapGesture().onEnded({
                                controlador.descargar_informacion_personaje(id: personaje.id)
                            }))
                        }
                    }
                }
            }
        }
        else {
            ProgressView("Cargando personajes...")
        }
    }
}

//struct PantallaPersonajes: View {
//    @Environment(ControladorAplicacion.self) var controlador
//    
//    var body: some View {
//        if(controlador.pagina_resultados_personaje != nil){
//            NavigationStack{
//                ScrollView{
//                    LazyVStack{
//                        HStack{
//                            Text("Personajes")
//                                .padding()
//                                .font(.largeTitle)
//                                .bold()
//                        }
//                        ForEach(controlador.pagina_resultados_personaje!.results){ personaje in
//                            NavigationLink {
//                                PantallaDetallesPersonaje()
//                            } label: {
//                                HStack {
//                                    Text("\(personaje.name)")
//                                }
//                            }
//                            .simultaneousGesture(TapGesture().onEnded({
//                                controlador.descargar_informacion_personaje(id: personaje.id)
//                            }))
//                        }
//                    }
//                }
//            }
//        }
//    }
//}

#Preview {
    Personajes()
        .environment(ControladorAplicacion())
}

//#Preview{
//    PantallaPersonajes()
//        .environment(ControladorAplicacion())
//}
