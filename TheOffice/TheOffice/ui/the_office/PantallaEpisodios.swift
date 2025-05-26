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
                                Text("Episodios")
                                    .font(.largeTitle)
                                    .bold()
                                    .padding(.top)
                                    .padding(.leading)
                                Spacer()
                            }
                            ForEach(controlador.pagina_resultados_episodio!.results){ episodio in
                                NavigationLink {
                                    PantallaDetallesEpisodio(episodio: episodio)
                                } label: {
                                    ZStack(alignment: .bottomLeading){
                                        Image(imagenes_episodios[episodio.id] ?? "default")
                                            .resizable()
                                            .scaledToFill()
                                            .frame(height: 180)
                                            .frame(maxWidth: .infinity)
                                            .clipped()
                                        Text("\(episodio.title)")
                                            .font(.headline)
                                            .padding(8)
                                            .background(Color.black.opacity(0.6))
                                            .foregroundColor(.white)
                                            .cornerRadius(8)
                                            .padding([.leading, .bottom], 8)
                                    }
                                    .clipShape(RoundedRectangle(cornerRadius: 18))
                                    .padding(.horizontal)
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

