//
//  PantallaPersonajes.swift
//  TheOffice
//
//  Created by alumno on 5/12/25.
//

import Foundation
import SwiftUI

import SwiftUI

struct Personajes: View {
    @Environment(ControladorAplicacion.self) var controlador
    
    let columnas = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    var body: some View {
        if let personajes = controlador.pagina_resultados_personaje?.results {
            NavigationStack {
                ScrollView {
                    VStack(alignment: .leading) {
                        Text("Personajes")
                            .font(.largeTitle)
                            .bold()
                            .padding(.horizontal)
                            .padding(.top)
                        
                        LazyVGrid(columns: columnas, spacing: 16) {
                            ForEach(personajes) { personaje in
                                NavigationLink {
                                    PantallaDetallesPersonaje(personaje: personaje)
                                } label: {
                                    ZStack(alignment: .bottomLeading) {
                                        Image(imagenes_The_Office[personaje.id] ?? "default")
                                            .resizable()
                                            .scaledToFill()
                                            .frame(height: 180)
                                            .frame(maxWidth: .infinity)
                                            .clipped()
                                        
                                        Text(personaje.name)
                                            .font(.headline)
                                            .padding(8)
                                            .background(Color.black.opacity(0.6))
                                            .foregroundColor(.white)
                                            .cornerRadius(8)
                                            .padding([.leading, .bottom], 8)
                                    }
                                    .clipShape(RoundedRectangle(cornerRadius: 18))
                                }
                                .simultaneousGesture(TapGesture().onEnded {
                                    controlador.descargar_informacion_personaje(id: personaje.id)
                                })
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
        } else {
            ProgressView("Cargando personajes...")
        }
    }
}


#Preview {
    Personajes()
        .environment(ControladorAplicacion())
}

//#Preview{
//    PantallaPersonajes()
//        .environment(ControladorAplicacion())
//}
