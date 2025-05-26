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
    
    let columnas = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    var body: some View {
        if let temporadas = controlador.temporadas {
            NavigationStack {
                ScrollView {
                    HStack{
                        Text("Temporadas")
                            .font(.largeTitle)
                            .bold()
                            .padding(.top)
                            .padding(.leading)
                        Spacer()
                    }
                    LazyVGrid(columns: columnas, spacing: 16){
                        ForEach(temporadas) { temporada in
                            NavigationLink {
                                PantallaDetallesTemporada(temporada: temporada)
                            } label: {
                                ZStack(alignment: .bottomLeading){
                                    Image(imagenes_temporadas[temporada.id] ?? "0")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(height: 220)
                                        .frame(maxWidth: .infinity)
                                        .clipped()
                                    Text("Temporada \(temporada.number)")
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
                                controlador.descargar_informacion_temporada(id: temporada.id)
                            })
                        }
                    }
                    .padding(.horizontal)
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
