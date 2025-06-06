//
//  PantallaDetallesEpisodio.swift
//  TheOffice
//
//  Created by alumno on 5/19/25.
//

import Foundation
import SwiftUI

let episodio_falso = Episodio(id: 1, title: "Piloto", episode: "1", seriesEpisodeNumber: 1, airDate: "2005", season: nil, summary: "El resumen no esta disponible")

struct PantallaDetallesEpisodio: View {
    let episodio: Episodio
    
    @State private var animateGradient: Bool = false
    private let startColor: Color = Color("CafeClaro")
    private let endColor: Color = Color("CafeOscuro")
    
    @State private var girando = false
    
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
                            .mask(
                                LinearGradient(gradient: Gradient(colors: [.black.opacity(0.9), .black.opacity(0.3), .clear]),
                                                           startPoint: .center,
                                                           endPoint: .bottom)
                            )
                            .clipShape(RoundedRectangle(cornerRadius: 18))
                    }
                    .padding(.horizontal)
                    .padding(.top)
                    
                    HStack{
                        Text("\(episodio.title ?? "No disponible")")
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.white)
                    }
                    
                    HStack{
                        VStack{
                            Text("Episodio")
                                .padding(.horizontal, 12)
                                .padding(.top, 10)
                                .font(.subheadline)
                            Text("\(episodio.episode ?? "Desconocido")")
                                .padding(.horizontal, 12)
                                .padding(.bottom, 10)
                                .font(.headline)
                                .bold()
                        }
                        .frame(maxWidth: .infinity)
                        .background(Color.brown.opacity(0.6), in: RoundedRectangle(cornerRadius: 14))
                        .foregroundColor(.white)
                        
                        VStack{
                            Text("Año de emisión")
                                .padding(.horizontal, 12)
                                .padding(.top, 10)
                                .font(.subheadline)
                            Text("\(episodio.airDate ?? "No disponible")")
                                .padding(.horizontal, 12)
                                .padding(.bottom, 10)
                                .font(.headline)
                        }
                        .frame(maxWidth: .infinity)
                        .background(Color.brown.opacity(0.6), in: RoundedRectangle(cornerRadius: 14))
                        .foregroundColor(.white)
                    }
                    .padding(.horizontal)
                    HStack{
                        VStack{
                            Text("Número de episodio en la serie")
                                .padding(.horizontal, 12)
                                .padding(.top, 10)
                                .font(.subheadline)
                            Text("\(episodio.seriesEpisodeNumber ?? 1)")
                                .padding(.horizontal, 12)
                                .padding(.bottom, 10)
                                .font(.headline)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .background(Color.brown.opacity(0.6), in: RoundedRectangle(cornerRadius: 14))
                    .foregroundColor(.white)
                    .padding(.horizontal)
                    
                    HStack{
                        Text("\(episodio.summary ?? "El resumen no está disponible")")
                            .padding(.horizontal, 12)
                            .padding(.vertical, 10)
                    }
                    .frame(maxWidth: .infinity)
                    .background(Color.brown.opacity(0.6), in: RoundedRectangle(cornerRadius: 14))
                    .foregroundColor(.white)
                    .padding(.horizontal)
                    .multilineTextAlignment(.center)
                }
                .background{
                    LinearGradient(colors: [startColor, endColor], startPoint: .topLeading, endPoint: .bottomTrailing)
                                    .edgesIgnoringSafeArea(.all)
                                    .hueRotation(.degrees(animateGradient ? 45 : 0))
                                    .onAppear {
                                        withAnimation(.easeInOut(duration: 3).repeatForever(autoreverses: true)) {
                                            animateGradient.toggle()
                                        }
                                    }
                }
            }
        }
        else {
            ZStack {
                LinearGradient(colors: [startColor, endColor], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
                    .hueRotation(.degrees(animateGradient ? 45 : 0))
                    .onAppear {
                        withAnimation(.easeInOut(duration: 3).repeatForever(autoreverses: true)) {
                            animateGradient.toggle()
                        }
                    }
                VStack {
                    Image("dundie-award")
                        .resizable()
                        .frame(width: 80, height: 80)
                        .rotationEffect(Angle.degrees(girando ? 360 : 0))
                        .animation(.linear(duration: 1.2).repeatForever(autoreverses: false), value: girando)
                        .onAppear {
                            girando = true
                        }

                    Text("Cargando episodio...")
                        .foregroundColor(.white)
                        .padding(.top, 12)
                        .bold()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

#Preview {
    PantallaDetallesEpisodio(episodio: episodio_falso)
        .environment(ControladorAplicacion())
}
