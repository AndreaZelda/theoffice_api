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
    
    @State private var animateGradient: Bool = false
    private let startColor: Color = Color("CafeClaro")
    private let endColor: Color = Color("CafeOscuro")
    
    @State private var girando = false
    
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
                                .frame(height: 550)
                                .frame(maxWidth: .infinity)
                                .clipped()
                                .mask(
                                    LinearGradient(gradient: Gradient(colors: [.clear, .black.opacity(0.98), .clear]),
                                                               startPoint: .top,
                                                               endPoint: .bottom)
                                )
                        }
                        .padding(.horizontal)
                        VStack {
                            Text("Temporada \(temporada.number)")
                                .font(.largeTitle)
                                .bold()
                                .foregroundColor(.white)
                            HStack{
                                VStack{
                                    Text("Inicio de Emisión")
                                        .padding(.horizontal, 12)
                                        .padding(.top, 8)
                                        .bold()
                                        .font(.subheadline)
                                    Text("\(temporada.startDate ?? "unknown")")
                                        .padding(.horizontal, 12)
                                        .padding(.bottom, 8)
                                        .font(.headline)
                                }
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .background(Color.brown.opacity(0.6), in: RoundedRectangle(cornerRadius: 14))
                                .foregroundColor(.white)
                                VStack{
                                    Text("Finalización")
                                        .padding(.horizontal, 12)
                                        .padding(.top, 8)
                                        .bold()
                                        .font(.subheadline)
                                    Text("\(temporada.endDate ?? "unknown")")
                                        .padding(.horizontal, 12)
                                        .padding(.bottom, 8)
                                        .font(.headline)
                                }
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .background(Color.brown.opacity(0.6), in: RoundedRectangle(cornerRadius: 14))
                                .foregroundColor(.white)
                            }
                            .padding(.horizontal)
                        }
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
            VStack {
                Image("dundie-award")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .rotationEffect(Angle.degrees(girando ? 360 : 0))
                    .animation(Animation.linear(duration: 1.2).repeatForever(autoreverses: false), value: girando)
                    .onAppear {
                        girando = true
                    }

                Text("Cargando temporada...")
                    .foregroundColor(.white)
                    .padding(.top, 12)
                    .bold()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
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
}

#Preview {
    PantallaDetallesTemporada(temporada: temporada_falsa)
        .environment(ControladorAplicacion())
}

