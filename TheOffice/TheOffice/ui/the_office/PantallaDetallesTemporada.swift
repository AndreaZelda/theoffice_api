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
                        HStack{
                            Image(imagenes_temporadas[temporada.id] ?? "0")
                                .resizable()
                                .scaledToFill()
                                .frame(height: 500)
                                .frame(maxWidth: .infinity)
                                .clipped()
                                .clipShape(RoundedRectangle(cornerRadius: 18))
                        }
                        .padding(.horizontal)
                        VStack {
                            Text("Temporada \(temporada.number)")
                                .font(.largeTitle)
                                .bold()
                            HStack{
                                VStack{
                                    Text("Emisión")
                                        .padding(.horizontal, 12)
                                        .padding(.top, 8)
                                    Text("\(temporada.startDate ?? "unknown")")
                                        .padding(.horizontal, 12)
                                        .padding(.bottom, 8)
                                }
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .background(Color.indigo, in: RoundedRectangle(cornerRadius: 14))
                                .foregroundColor(.white)
                                VStack{
                                    Text("Finalización")
                                        .padding(.horizontal, 12)
                                        .padding(.top, 8)
                                    Text("\(temporada.endDate ?? "unknown")")
                                        .padding(.horizontal, 12)
                                        .padding(.bottom, 8)
                                }
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .background(Color.indigo, in: RoundedRectangle(cornerRadius: 14))
                                .foregroundColor(.white)
                            }
                            .padding(.horizontal)
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

