//
//  PantallaDetallesPersonaje.swift
//  TheOffice
//
//  Created by alumno on 5/12/25.
//

import Foundation
import SwiftUI

let personaje_falso = Oficinista(id: 55, name: "Michael", gender: "Male", marital: "Holly", job: nil, workplace: nil, firstAppearance: "Pilot", lastAppearance: "Goodbye Michael", actor: "Steve Carrell", episodes: nil)

struct PantallaDetallesPersonaje: View {
    
    @State private var animateGradient: Bool = false
    private let startColor: Color = Color("CafeClaro")
    private let endColor: Color = Color("CafeOscuro")
    
    let personaje: Oficinista
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View {
        if(controlador.pagina_resultados_personaje != nil){
            NavigationStack{
                ScrollView{
                    Image(imagenes_The_Office[personaje.id] ?? "1_Alex")
                        .resizable()
                        .scaledToFill()
                        .frame(height: 400)
                        .frame(maxWidth: .infinity)
                        .clipped()
                        .mask(
                            LinearGradient(gradient: Gradient(colors: [.clear, .black.opacity(0.95), .clear]),
                                                       startPoint: .top,
                                                       endPoint: .bottom)
                        )
                    Text("\(personaje.name ?? "No disponible")")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.white)
                    Text("\(personaje.actor ?? "Desconocid@")")
                        .foregroundColor(.white)
                    HStack {
                        VStack {
                            Text("Género")
                                .padding(.horizontal, 12)
                                .padding(.top, 8)
                                .font(.subheadline)
                            Text("\(personaje.gender ?? "N/A")")
                                .padding(.horizontal, 12)
                                .padding(.bottom, 8)
                                .bold()
                                .font(.headline)
                        }
                        .frame(maxWidth: .infinity)
                        .background(Color.brown.opacity(0.6), in: RoundedRectangle(cornerRadius: 14))
                        .foregroundColor(.white)

                        VStack {
                            Text("Pareja")
                                .padding(.horizontal, 12)
                                .padding(.top, 8)
                                .font(.subheadline)
                            Text("\(personaje.marital ?? "Soltero")")
                                .padding(.horizontal, 12)
                                .padding(.bottom, 8)
                                .bold()
                                .font(.headline)
                        }
                        .frame(maxWidth: .infinity)
                        .background(Color.brown.opacity(0.6), in: RoundedRectangle(cornerRadius: 14))
                        .foregroundColor(.white)
                    }
                    .padding(.horizontal)

                    HStack(alignment: .top, spacing: 16) {
                        // Trabajos
                        VStack(alignment: .leading, spacing: 6) {
                            Text("Trabajos:")
                                .bold()
                            
                            if let trabajos = personaje.job, !trabajos.isEmpty {
                                ForEach(trabajos, id: \.self) { trabajo in
                                    Text("• \(trabajo)")
                                }
                            } else {
                                Text("• Desconocido")
                            }
                        }
                        .padding()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.brown.opacity(0.6), in: RoundedRectangle(cornerRadius: 14))
                        .foregroundColor(.white)

                        // Lugares de trabajo
                        VStack(alignment: .leading, spacing: 6) {
                            Text("Lugares de trabajo:")
                                .bold()
                            
                            if let lugares = personaje.workplace, !lugares.isEmpty {
                                ForEach(lugares, id: \.self) { lugar in
                                    Text("• \(lugar)")
                                }
                            } else {
                                Text("• Desconocido")
                            }
                        }
                        .padding()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.brown.opacity(0.6), in: RoundedRectangle(cornerRadius: 14))
                        .foregroundColor(.white)
                    }
                    .padding(.horizontal)


                    HStack{
                        VStack{
                            Text("Primera aparición")
                                .padding(.horizontal, 12)
                                .padding(.top, 8)
                                .font(.subheadline)
                            Text("\(personaje.firstAppearance ?? "Desconocida")")
                                .padding(.horizontal, 12)
                                .padding(.bottom, 8)
                                .bold()
                                .font(.headline)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.brown.opacity(0.6), in: RoundedRectangle(cornerRadius: 14))
                        .foregroundColor(.white)
                        VStack{
                            Text("Última aparición")
                                .padding(.horizontal, 12)
                                .padding(.top, 8)
                                .font(.subheadline)
                            Text("\(personaje.lastAppearance ?? "Desconocida")")
                                .padding(.horizontal, 12)
                                .padding(.bottom, 8)
                                .bold()
                                .font(.headline)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.brown.opacity(0.6), in: RoundedRectangle(cornerRadius: 14))
                        .foregroundColor(.white)
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
        }
    }
}

#Preview {
    PantallaDetallesPersonaje(personaje: personaje_falso)
        .environment(ControladorAplicacion())
}
