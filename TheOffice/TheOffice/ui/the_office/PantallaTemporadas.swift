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
    @State private var girando = false
    
    @State private var animateGradient: Bool = false
    private let startColor: Color = Color("CafeClaro")
    private let endColor: Color = Color("CafeOscuro")
    
    let columnas = [
        GridItem(.flexible(), spacing: 16),
        GridItem(.flexible(), spacing: 16)
    ]
    
    var body: some View {
        if let temporadas = controlador.temporadas {
            NavigationStack {
                ScrollView {
                    HStack{
                        Image("titulo_temporadas")
                            .resizable()
                            .scaledToFill()
                            .padding(.horizontal)
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
                                        .background(Color.brown.opacity(0.6))
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

                    Text("Cargando temporadas...")
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
    Temporadas()
        .environment(ControladorAplicacion())
}
