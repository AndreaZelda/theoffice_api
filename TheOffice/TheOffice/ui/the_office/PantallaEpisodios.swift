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
    @State private var girando = false
    
    @State private var animateGradient: Bool = false
    private let startColor: Color = Color("CafeClaro")
    private let endColor: Color = Color("CafeOscuro")
    
    var body: some View {
        if(controlador.pagina_resultados_episodio != nil){
            NavigationStack{
                ScrollView{
                    LazyVStack{
                            HStack{
                                Image("titulo_episodios")
                                    .resizable()
                                    .scaledToFill()
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
                                            .background(Color.brown.opacity(0.6))
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
            VStack {
                Image("dundie-award")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .rotationEffect(Angle.degrees(girando ? 360 : 0))
                    .animation(Animation.linear(duration: 1.2).repeatForever(autoreverses: false), value: girando)
                    .onAppear {
                        girando = true
                    }

                Text("Cargando episodios...")
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
    Episodios()
        .environment(ControladorAplicacion())
}

