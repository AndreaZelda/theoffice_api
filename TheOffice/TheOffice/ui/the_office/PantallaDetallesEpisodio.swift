//
//  PantallaDetallesEpisodio.swift
//  TheOffice
//
//  Created by alumno on 5/19/25.
//

import Foundation
import SwiftUI

let episodio_falso = Episodio(id: 1, title: "Piloto", episode: "1", seriesEpisodeNumber: 1, airDate: "2005", season: nil)

struct PantallaDetallesEpisodio: View {
    let episodio: Episodio
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View {
        if(controlador.pagina_resultados_episodio != nil){
            NavigationStack{
                ScrollView{
                    HStack{
                        Image(imagenes_episodios[episodio.id] ?? "default")
                            .resizable()
                            .scaledToFill()
                            .frame(height: 200)
                            .frame(maxWidth: .infinity)
                            .clipped()
                            .clipShape(RoundedRectangle(cornerRadius: 18))
                    }
                    .padding(.horizontal)
                    
                    HStack{
                        Text("\(episodio.title ?? "Nombrecito")")
                            .font(.largeTitle)
                            .bold()
                    }
                    
                    HStack{
                        VStack{
                            Text("Episodio: \(episodio.episode ?? "Episiodito")")
                                .padding(.horizontal, 12)
                                .padding(.vertical, 10)
                        }
                        .frame(maxWidth: .infinity)
                        .background(Color.indigo, in: RoundedRectangle(cornerRadius: 14))
                        .foregroundColor(.white)
                        VStack{
                            Text("\(episodio.airDate ?? "Añito")")
                                .padding(.horizontal, 12)
                                .padding(.vertical, 10)
                        }
                        .frame(maxWidth: .infinity)
                        .background(Color.indigo, in: RoundedRectangle(cornerRadius: 14))
                        .foregroundColor(.white)
                    }
                    .padding(.horizontal)
                    HStack{
                        Text("Número de episodio en la serie: \(episodio.seriesEpisodeNumber ?? 1)")
                            .padding(.horizontal, 12)
                            .padding(.vertical, 10)
                    }
                    .frame(maxWidth: .infinity)
                    .background(Color.indigo, in: RoundedRectangle(cornerRadius: 14))
                    .foregroundColor(.white)
                    .padding(.horizontal)
                    
                    
                    
                    
                    
                }
            }
        }
    }
}

#Preview {
    PantallaDetallesEpisodio(episodio: episodio_falso)
        .environment(ControladorAplicacion())
}
