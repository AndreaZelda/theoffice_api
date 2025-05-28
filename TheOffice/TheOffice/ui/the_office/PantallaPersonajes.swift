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
    @State private var girando = false
    
    @State private var animateGradient: Bool = false
    private let startColor: Color = Color("CafeClaro")
    private let endColor: Color = Color("CafeOscuro")
    
    let columnas = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    var body: some View {
        if let personajes = controlador.pagina_resultados_personaje?.results {
            NavigationStack {
                ScrollView {
                    VStack(alignment: .leading) {
                        Image("titulo_personajes")
                            .resizable()
                            .scaledToFill()
                            .padding(.horizontal)
                        
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
                                            .background(Color.brown.opacity(0.6))
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
        } else {
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

                    Text("Cargando personajes...")
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
    Personajes()
        .environment(ControladorAplicacion())
}

//#Preview{
//    PantallaPersonajes()
//        .environment(ControladorAplicacion())
//}
