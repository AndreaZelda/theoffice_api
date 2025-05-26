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
    let personaje: Oficinista
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View {
        if(controlador.pagina_resultados_personaje != nil){
            NavigationStack{
                ScrollView{
                    Image(imagenes_The_Office[personaje.id] ?? "1_Alex")
                        .resizable()
                        .scaledToFill()
                        .frame(height: 300)
                        .frame(maxWidth: .infinity)
                        .clipped()
                        .clipShape(.circle)
                    Text("\(personaje.name ?? "Nombrecito")")
                        .font(.largeTitle)
                        .bold()
                    Text("\(personaje.actor ?? "Desconocid@")")
                    HStack {
                        VStack {
                            Text("Género")
                                .padding(.horizontal, 12)
                                .padding(.top, 8)
                            Text("\(personaje.gender ?? "N/A")")
                                .padding(.horizontal, 12)
                                .padding(.bottom, 8)
                        }
                        .frame(maxWidth: .infinity)
                        .background(Color.indigo, in: RoundedRectangle(cornerRadius: 14))
                        .foregroundColor(.white)

                        VStack {
                            Text("Pareja")
                                .padding(.horizontal, 12)
                                .padding(.top, 8)
                            Text("\(personaje.marital ?? "Soltero")")
                                .padding(.horizontal, 12)
                                .padding(.bottom, 8)
                        }
                        .frame(maxWidth: .infinity)
                        .background(Color.indigo, in: RoundedRectangle(cornerRadius: 14))
                        .foregroundColor(.white)
                    }
                    .padding(.horizontal)

                    HStack(alignment: .top, spacing: 16) {
                        VStack(alignment: .leading, spacing: 6) {
                            if let trabajos = personaje.job {
                                Text("Trabajos:")
                                    .bold()
                                ForEach(trabajos, id: \.self) { trabajo in
                                    Text("• \(trabajo)")
                                }
                            }
                        }
                        .padding()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.indigo, in: RoundedRectangle(cornerRadius: 14))
                        .foregroundColor(.white)

                        VStack(alignment: .leading, spacing: 6) {
                            if let lugares = personaje.workplace {
                                Text("Lugares de trabajo:")
                                    .bold()
                                ForEach(lugares, id: \.self) { lugar in
                                    Text("• \(lugar)")
                                }
                            }
                        }
                        .padding()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.indigo, in: RoundedRectangle(cornerRadius: 14))
                        .foregroundColor(.white)
                    }
                    .padding(.horizontal)

                    HStack{
                        VStack{
                            Text("Primera aparición")
                                .padding(.horizontal, 12)
                                .padding(.top, 8)
                            Text("\(personaje.firstAppearance ?? "Desconocida")")
                                .padding(.horizontal, 12)
                                .padding(.bottom, 8)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.indigo, in: RoundedRectangle(cornerRadius: 14))
                        .foregroundColor(.white)
                        VStack{
                            Text("Última aparición")
                                .padding(.horizontal, 12)
                                .padding(.top, 8)
                            Text("\(personaje.lastAppearance ?? "Desconocida")")
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
}

#Preview {
    PantallaDetallesPersonaje(personaje: personaje_falso)
        .environment(ControladorAplicacion())
}
